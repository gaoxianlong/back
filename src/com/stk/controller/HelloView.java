package com.stk.controller;

import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.stk.entity.Backcode;
import com.stk.entity.User;


public class HelloView extends AbstractExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        // TODO Auto-generated method stub
         String fileName = "未注册学校excel.xls";  
            response.setCharacterEncoding("UTF-8");  
            response.setContentType("application/ms-excel");  
            response.setHeader("Content-Disposition", "inline; filename="+new String(fileName.getBytes(),"iso8859-1"));  
            OutputStream outputStream = response.getOutputStream();

            List<Backcode> userList = (List<Backcode>) model.get("userList");
            // 产生Excel表头
            HSSFSheet sheet = workbook.createSheet("未注册学校信息");
            HSSFRow header = sheet.createRow(0);
            // 产生标题列
            header.createCell(0).setCellValue("编号");
            header.createCell(1).setCellValue("学校名称");

            header.createCell(2).setCellValue("免费学习验证码");
            header.createCell(3).setCellValue("剩余数量");
            header.createCell(4).setCellValue("权益");
           // header.createCell(5).setCellValue("创建时间");
            header.createCell(5).setCellValue("总数");
            
            
            
            HSSFCellStyle cellStyle = workbook.createCellStyle();
            cellStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("mm/dd/yyyy"));
            int rowNumber = 1;
            for (Backcode backcode : userList) {
                HSSFRow row = sheet.createRow(rowNumber++);
                // 产生标题列
                row.createCell(0).setCellValue(backcode.getID());
                row.createCell(1).setCellValue(backcode.getSchools());
                row.createCell(2).setCellValue(backcode.getHelpCode());
                row.createCell(3).setCellValue(backcode.getNum());
                row.createCell(4).setCellValue(backcode.getQuan());
               // row.createCell(5).setCellValue(backcode.getCreateTime());
                row.createCell(5).setCellValue(backcode.getTotal());
            }
            workbook.write(outputStream);
            outputStream.flush();
            outputStream.close();
    }


}