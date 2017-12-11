package com.stk.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.common.utils.BinaryUtil;
import com.aliyun.oss.model.MatchMode;
import com.aliyun.oss.model.PolicyConditions;

import junit.framework.Assert;
import net.sf.json.JSONObject;

@Controller
public class PostObjectPolicy extends HttpServlet{
	
	private static final long serialVersionUID = 5522372203700422672L;

	 @RequestMapping(value = "/jsup")  
	 @ResponseBody
	protected String jsup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
	
	    String endpoint = "http://oss-cn-beijing.aliyuncs.com";
        String accessId = "aJjWwUSjpYtA25g3";
        String accessKey = "naQPJcccQEYDoBJlRnO3TcmojNrCRL";
        String bucket = "shoutike";
        String dir = "qwert";
        String host = "http://" + bucket + "." + endpoint;
        OSSClient client = new OSSClient(endpoint, accessId, accessKey);
         	
        	long expireTime = 30;
        	long expireEndTime = System.currentTimeMillis() + expireTime * 1000;
            Date expiration = new Date(expireEndTime);
            PolicyConditions policyConds = new PolicyConditions();
            policyConds.addConditionItem(PolicyConditions.COND_CONTENT_LENGTH_RANGE, 0, 1048576000);
            policyConds.addConditionItem(MatchMode.StartWith, PolicyConditions.COND_KEY, dir);

            String postPolicy = client.generatePostPolicy(expiration, policyConds);
            byte[] binaryData = postPolicy.getBytes("utf-8");
            String encodedPolicy = BinaryUtil.toBase64String(binaryData);
            String postSignature = client.calculatePostSignature(postPolicy);
            
            Map<String, String> respMap = new LinkedHashMap<String, String>();
            respMap.put("accessid", accessId);
            respMap.put("policy", encodedPolicy);
            respMap.put("signature", postSignature);
            //respMap.put("expire", formatISO8601Date(expiration));
            respMap.put("dir", dir);
            respMap.put("host", host);
            respMap.put("expire", String.valueOf(expireEndTime / 1000));
            JSONObject ja1 = JSONObject.fromObject(respMap);
            System.out.println(ja1.toString());
            //response.setHeader("Access-Control-Allow-Origin", "*");
            //response.setHeader("Access-Control-Allow-Methods", "GET, POST");
           
            System.out.println(ja1.toString());
            return ja1.toString();
    }
	
	
}
