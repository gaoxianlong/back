package PublicMethod;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.common.utils.BinaryUtil;
import com.aliyun.oss.model.MatchMode;
import com.aliyun.oss.model.PolicyConditions;
import com.stk.entity.Signatu;

public class SignatuMethod {
	static Signatu signatu =new Signatu();

	public static Signatu getSign() throws UnsupportedEncodingException { 
	  String endpoint = "http://oss-cn-beijing.aliyuncs.com";
      String accessId = "aJjWwUSjpYtA25g3";
      String accessKey = "naQPJcccQEYDoBJlRnO3TcmojNrCRL";
      String bucket = "shoutike";
      String dir = "shoutike";
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
          signatu.setAccessid(accessId);
          signatu.setPolicyBase64(encodedPolicy);
          signatu.setSignature(postSignature);
          
		return signatu;
          
	}
}
