/**
 * 
 */
package sley.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import sley.finance.dto.SalaryDto;
import sley.finance.model.Salary;

/**
 * @author wangli
 *
 */
public class ReadExcel {
	 //总行数
    private int totalRows = 0;  
    //总条数
    private int totalCells = 0; 
    //错误信息接收器
    private String errorMsg;
    //构造方法
    public ReadExcel(){}
    //获取总行数
    public int getTotalRows()  { return totalRows;} 
    //获取总列数
    public int getTotalCells() {  return totalCells;} 
    //获取错误信息
    public String getErrorInfo() { return errorMsg; }  
    
  /**
   * 验证EXCEL文件
   * @param filePath
   * @return
   */
  public boolean validateExcel(String filePath){
        if (filePath == null || !(WDWUtil.isExcel2003(filePath) || WDWUtil.isExcel2007(filePath))){  
            errorMsg = "文件名不是excel格式";  
            return false;  
        }  
        return true;
  }
    
  /**
   * 读EXCEL文件，获取客户信息集合
   * @param fielName
   * @return
   */
  public List<Salary> getExcelInfo(String userType,String fileName,MultipartFile Mfile){
      
      //把spring文件上传的MultipartFile转换成CommonsMultipartFile类型
       CommonsMultipartFile cf= (CommonsMultipartFile)Mfile; //获取本地存储路径
       File file = new  File("D:\\fileupload");
       //创建一个目录 （它的路径名由当前 File 对象指定，包括任一必须的父路径。）
       if (!file.exists())
    	   {file.mkdirs();}
       //新建一个文件
       File file1 = new File("D:\\fileupload\\" +fileName+ new Date().getTime() + ".xlsx"); 
       //将上传的文件写入新建的文件中
       try {
           cf.getFileItem().write(file1); 
       } catch (Exception e) {
           e.printStackTrace();
       }
       
       //初始化工资条信息的集合    
       List<Salary> salaryList=new ArrayList<Salary>();
       //初始化输入流
       InputStream is = null;  
       try{
          //验证文件名是否合格
          if(!validateExcel(fileName)){
              return null;
          }
          //根据文件名判断文件是2003版本还是2007版本
          boolean isExcel2003 = true; 
          if(WDWUtil.isExcel2007(fileName)){
              isExcel2003 = false;  
          }
          //根据新建的文件实例化输入流
          is = new FileInputStream(file1);
          //根据excel里面的内容读取工资信息
          salaryList = getExcelInfo(userType,is, isExcel2003); 
          is.close();
      }catch(Exception e){
          e.printStackTrace();
      } finally{
          if(is !=null)
          {
              try{
                  is.close();
              }catch(IOException e){
                  is = null;    
                  e.printStackTrace();  
              }
          }
      }
      return salaryList;
  }
  /**
   * 根据excel里面的内容读取客户信息
   * @param is 输入流
   * @param isExcel2003 excel是2003还是2007版本
   * @return
   * @throws IOException
   */
  public  List<Salary> getExcelInfo(String userType,InputStream is,boolean isExcel2003){
       List<Salary> salaryList=null;
       try{
           /** 根据版本选择创建Workbook的方式 */
           Workbook wb = null;
           //当excel是2003时
           if(isExcel2003){
               wb = new HSSFWorkbook(is); 
           }
           else{//当excel是2007时
               wb = new XSSFWorkbook(is); 
           }
           //读取Excel里面工资的信息
           salaryList=readExcelValue(userType,wb);
       }
       catch (IOException e)  {  
           e.printStackTrace();  
       }  
       return salaryList;
  }
  /**
   * 读取Excel里面客户的信息
   * @param wb
   * @return
   */
  private List<Salary> readExcelValue(String userType,Workbook wb){ 
      //得到第一个shell  
	  Sheet sheet;
	  if(userType!=null&&userType.equals("1")){//如果是合同和同工同酬合同 则解读sheet1和sheet0
		   sheet =wb.getSheet("正式人员");
	  }else if(userType!=null&&userType.equals("2")){
		   sheet=wb.getSheet("合同制普职");
	  }else{
		   sheet=wb.getSheet("合同制大夫");
	  }
      
      //得到Excel的行数
       this.totalRows=sheet.getPhysicalNumberOfRows();
       
      //得到Excel的列数(前提是有行数)
       if(totalRows>=1 && sheet.getRow(0) != null){
            this.totalCells=sheet.getRow(0).getPhysicalNumberOfCells();
       }
       
       List<Salary> salaryList=new ArrayList<Salary>();
       Salary salary;            
      //循环Excel行数,从第二行开始。标题不入库
       for(int r=2;r<totalRows;r++){
           Row row = sheet.getRow(r);
           if (row == null) continue;
           if (row.getCell(0) == null) continue;
           row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
           String userName=row.getCell(1).getStringCellValue();
           if(userName==null||userName.equals("")){
        	   continue;
        	   
           }
    	   row.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
    	   row.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
    	   row.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
    	   row.getCell(6).setCellType(Cell.CELL_TYPE_STRING);
    	   row.getCell(7).setCellType(Cell.CELL_TYPE_STRING);
    	   row.getCell(8).setCellType(Cell.CELL_TYPE_STRING);
    	   row.getCell(9).setCellType(Cell.CELL_TYPE_STRING);
    	   row.getCell(10).setCellType(Cell.CELL_TYPE_STRING);
    	   row.getCell(11).setCellType(Cell.CELL_TYPE_STRING);
    	   row.getCell(12).setCellType(Cell.CELL_TYPE_STRING);
    	   row.getCell(13).setCellType(Cell.CELL_TYPE_STRING);
    	   row.getCell(14).setCellType(Cell.CELL_TYPE_STRING);
    	   row.getCell(15).setCellType(Cell.CELL_TYPE_STRING);
    	   row.getCell(16).setCellType(Cell.CELL_TYPE_STRING);
    	   row.getCell(17).setCellType(Cell.CELL_TYPE_STRING);
    	   row.getCell(18).setCellType(Cell.CELL_TYPE_STRING);
    	   row.getCell(19).setCellType(Cell.CELL_TYPE_STRING);
    	   row.getCell(20).setCellType(Cell.CELL_TYPE_STRING);
    	   row.getCell(21).setCellType(Cell.CELL_TYPE_STRING);
           salary = new Salary();
           if(userType!=null&&userType.equals("1")){ //正式
               salary.setUserId(row.getCell(0).getStringCellValue());
               salary.setUserName(row.getCell(1).getStringCellValue());
               salary.setDepartName(row.getCell(2).getStringCellValue());
               if(row.getCell(3).getStringCellValue()==""){
            	   salary.setPositionSalary(new BigDecimal(0));
               }else{
            	   salary.setPositionSalary(new BigDecimal(row.getCell(3).getStringCellValue()));
               }
               if(row.getCell(4).getStringCellValue()==null||row.getCell(4).getStringCellValue()==""){
            	   salary.setGradeSalary(new BigDecimal(0));
               }else{
            	   salary.setGradeSalary(new BigDecimal(row.getCell(4).getStringCellValue()));
               }
               String aboveSalary=row.getCell(5).getStringCellValue();
               if(aboveSalary==null||aboveSalary.equals("")){
            	   salary.setAboveSalary(new BigDecimal(0));
               }else{
            	   salary.setAboveSalary(new BigDecimal(aboveSalary));
               }
               String baseSalary=row.getCell(6).getStringCellValue();
               if(baseSalary==null||baseSalary.equals("")){
            	   salary.setBaseSalary(new BigDecimal(0));
               }else{
            	   salary.setBaseSalary(new BigDecimal(baseSalary));
               }
               String encourageSalary=row.getCell(7).getStringCellValue();
               if(encourageSalary==null||encourageSalary.equals("")){
            	   salary.setEncourageSalary(new BigDecimal(0));
               }else{
            	   salary.setEncourageSalary(new BigDecimal(encourageSalary));
               }
               String floatSalary=row.getCell(8).getStringCellValue();
               if(floatSalary==null||floatSalary.equals("")){
            	   salary.setFloatSalary(new BigDecimal(0));
               }else{
            	   salary.setFloatSalary(new BigDecimal(floatSalary));
               }
               String tenSalary=row.getCell(9).getStringCellValue();
               if(tenSalary==null||tenSalary.equals("")){
            	   salary.setTenSalary(new BigDecimal(0));
               }else{
            	   salary.setTenSalary(new BigDecimal(tenSalary));
               }
               String nurseSalary=row.getCell(10).getStringCellValue();
               if(nurseSalary==null||nurseSalary.equals("")){
            	   salary.setNurseSalary(new BigDecimal(0));
               }else{
            	   salary.setNurseSalary(new BigDecimal(nurseSalary));
               }
               String healthSalary=row.getCell(11).getStringCellValue();
               if(healthSalary==null||healthSalary.equals("")){
            	   salary.setHealthSalary(new BigDecimal(0));
               }else{
            	   salary.setHealthSalary(new BigDecimal(healthSalary));
               }
               String nightSalary=row.getCell(12).getStringCellValue();
               if(nightSalary==null||nightSalary.equals("")){
            	   salary.setNightSalary(new BigDecimal(0));
               }else{
            	   salary.setNightSalary(new BigDecimal(nightSalary));
               }
               
               String houseSalary=row.getCell(13).getStringCellValue();
               if(houseSalary==null||houseSalary.equals("")){
            	   salary.setHouseSalary(new BigDecimal(0));
               }else{
            	   salary.setHouseSalary(new BigDecimal(houseSalary));
               }
               String propertySalary=row.getCell(14).getStringCellValue();
               if(propertySalary==null||propertySalary.equals("")){
            	   salary.setPropertySalary(new BigDecimal(0));
               }else{
            	   salary.setPropertySalary(new BigDecimal(propertySalary));
               }
               String grossSalary=row.getCell(15).getStringCellValue();
               if(grossSalary==null||grossSalary.equals("")){
            	   salary.setGrossSalary(new BigDecimal(0));
               }else{
            	   salary.setGrossSalary(new BigDecimal(grossSalary));
               }
               String hydropowerSalary=row.getCell(16).getStringCellValue();
               if(hydropowerSalary==null||hydropowerSalary.equals("")){
            	   salary.setHydropowerSalary(new BigDecimal(0));
               }else{
            	   salary.setHydropowerSalary(new BigDecimal(hydropowerSalary));
               }
               String memberSalary=row.getCell(17).getStringCellValue();
               if(memberSalary==null||memberSalary.equals("")){
            	   salary.setMemberSalary(new BigDecimal(0));
               }else{
            	   salary.setMemberSalary(new BigDecimal(memberSalary));
               }
               String oldPension=row.getCell(18).getStringCellValue();
               if(oldPension==null||oldPension.equals("")){
            	   salary.setOldPension(new BigDecimal(0));
               }else{
            	   salary.setOldPension(new BigDecimal(oldPension));
               }
               
               String occupAnnuity=row.getCell(19).getStringCellValue();
               if(occupAnnuity==null||occupAnnuity.equals("")){
            	   salary.setOccupAnnuity(new BigDecimal(0));
               }else{
            	   salary.setOccupAnnuity(new BigDecimal(occupAnnuity));
               }
               String unemploymentPay=row.getCell(20).getStringCellValue();
               if(unemploymentPay==null||unemploymentPay.equals("")){
            	   salary.setUnemploymentPay(new BigDecimal(0));
               }else{
            	   salary.setUnemploymentPay(new BigDecimal(unemploymentPay));
               }
               row.getCell(21).setCellType(Cell.CELL_TYPE_STRING);
               String medicalSalary=row.getCell(21).getStringCellValue();
               if(medicalSalary==null||medicalSalary.equals("")){
            	   salary.setMedicalSalary(new BigDecimal(0));
               }else{
            	   salary.setMedicalSalary(new BigDecimal(medicalSalary));
               }
               row.getCell(22).setCellType(Cell.CELL_TYPE_STRING);
               String houseFund=row.getCell(22).getStringCellValue();
               if(houseFund==null||houseFund.equals("")){
            	   salary.setHouseFund(new BigDecimal(0));
               }else{
            	   salary.setHouseFund(new BigDecimal(houseFund));
               }
               row.getCell(23).setCellType(Cell.CELL_TYPE_STRING);
               String performancePay=row.getCell(23).getStringCellValue();
               if(performancePay==null||performancePay.equals("")){
            	   salary.setPerformancePay(new BigDecimal(0));
               }else{
            	   salary.setPerformancePay(new BigDecimal(performancePay));
               }
               row.getCell(24).setCellType(Cell.CELL_TYPE_STRING);
               String otherPay=row.getCell(24).getStringCellValue();
               if(otherPay==null|| otherPay.equals("")){
            	   salary.setOtherPay(new BigDecimal(0));
               }else{
            	   salary.setOtherPay(new BigDecimal(otherPay));
               }
               row.getCell(25).setCellType(Cell.CELL_TYPE_STRING);
               String tax=row.getCell(25).getStringCellValue();
               if(tax==null|| tax.equals("")){
            	   salary.setTax(new BigDecimal(0));
               }else{
            	   salary.setTax(new BigDecimal(tax));
               }
              /* row.getCell(26).setCellType(Cell.CELL_TYPE_STRING);
               String totalDeduct=row.getCell(26).getStringCellValue();
               if(totalDeduct==null|| totalDeduct.equals("")){
            	   salary.setTotalDeduct(new BigDecimal(0));;
               }else{
            	   salary.setTotalDeduct(new BigDecimal(totalDeduct));
               }*/
               row.getCell(26).setCellType(Cell.CELL_TYPE_STRING);
               String netPay=row.getCell(26).getStringCellValue();
               if(netPay==null|| netPay.equals("")){
            	   salary.setNetPay(new BigDecimal(0));
               }else{
            	   salary.setNetPay(new BigDecimal(netPay));
               }
           }else  if(userType!=null && userType.equals("2")){ //如果为普通合同制
               salary.setUserId(row.getCell(0).getStringCellValue());
               salary.setDepartName(row.getCell(1).getStringCellValue());
               salary.setUserName(row.getCell(2).getStringCellValue());
               String positionSalary=row.getCell(3).getStringCellValue();
               if(positionSalary==null||positionSalary.equals("")){
            	   salary.setPositionSalary(new BigDecimal(0));
               }else{
            	   salary.setPositionSalary(new BigDecimal(positionSalary));
               }
               String gradeSalary=row.getCell(4).getStringCellValue();
               if(gradeSalary==null||gradeSalary.equals("")){
            	   salary.setGradeSalary(new BigDecimal(0));
               }else{
            	   salary.setGradeSalary(new BigDecimal(gradeSalary));
               }
               if(row.getCell(5).getStringCellValue()==null||row.getCell(5).getStringCellValue().equals("")){
            	   salary.setTitleSalary(new BigDecimal(0));
               }else{
            	   salary.setTitleSalary(new BigDecimal(row.getCell(5).getStringCellValue()));
               }
               if(row.getCell(6).getStringCellValue()==null||row.getCell(6).getStringCellValue().equals("")){
            	   salary.setPerformancePay(new BigDecimal(0));
               }else{
            	   salary.setPerformancePay(new BigDecimal(row.getCell(6).getStringCellValue()));
               }
               if(row.getCell(7).getStringCellValue()==null||row.getCell(7).getStringCellValue().equals("")){
            	   salary.setNightSalary(new BigDecimal(0));
               }else{
            	   salary.setNightSalary(new BigDecimal(row.getCell(7).getStringCellValue()));
               }
               if(row.getCell(8).getStringCellValue()==null||row.getCell(8).getStringCellValue().equals("")){
            	   salary.setOvertimePay(new BigDecimal(0));
               }else{
            	   salary.setOvertimePay(new BigDecimal(row.getCell(8).getStringCellValue()));
               }
               if(row.getCell(9).getStringCellValue()==null||row.getCell(9).getStringCellValue().equals("")){
            	   salary.setAllowance(new BigDecimal(0));
               }else{
            	   salary.setAllowance(new BigDecimal(row.getCell(9).getStringCellValue()));
               }
               if(row.getCell(10).getStringCellValue()==null||row.getCell(10).getStringCellValue().equals("")){
            	   salary.setOtherPay(new BigDecimal(0));
               }else{
            	   salary.setOtherPay(new BigDecimal(row.getCell(10).getStringCellValue()));
               }
               if(row.getCell(11).getStringCellValue()==null||row.getCell(11).getStringCellValue().equals("")){
            	   salary.setGrossSalary(new BigDecimal(0));
               }else{
            	   salary.setGrossSalary(new BigDecimal(row.getCell(11).getStringCellValue()));
               }
               if(row.getCell(12).getStringCellValue()==null||row.getCell(12).getStringCellValue().equals("")){
            	   salary.setMemberSalary(new BigDecimal(0));
               }else{
            	   salary.setMemberSalary(new BigDecimal(row.getCell(12).getStringCellValue()));
               }
               if(row.getCell(13).getStringCellValue()==null||row.getCell(13).getStringCellValue().equals("")){
            	   salary.setOldPension(new BigDecimal(0));
               }else{
            	   salary.setOldPension(new BigDecimal(row.getCell(13).getStringCellValue()));
               }
               String unemploymentPay=row.getCell(14).getStringCellValue();
               if(unemploymentPay==null||unemploymentPay.equals("")){
            	   salary.setUnemploymentPay(new BigDecimal(0));
               }else{
            	   salary.setUnemploymentPay(new BigDecimal(unemploymentPay));
               }
               String medicalSalary=row.getCell(15).getStringCellValue();
               if(medicalSalary==null||medicalSalary.equals("")){
            	   salary.setMedicalSalary(new BigDecimal(0));
               }else{
            	   salary.setMedicalSalary(new BigDecimal(medicalSalary));
               }
               String houseFund=row.getCell(16).getStringCellValue();
               if(houseFund==null||houseFund.equals("")){
            	   salary.setHouseFund(new BigDecimal(0));
               }else{
            	   salary.setHouseFund(new BigDecimal(houseFund));
               }
               String performancePay1=row.getCell(17).getStringCellValue();
               if(performancePay1==null||performancePay1.equals("")){
            	   salary.setPerformancePay1(new BigDecimal(0));
               }else{
            	   salary.setPerformancePay1(new BigDecimal(performancePay1));
               }
               String hydropowerSalary=row.getCell(18).getStringCellValue();
               if(hydropowerSalary==null||hydropowerSalary.equals("")){
            	   salary.setHydropowerSalary(new BigDecimal(0));
               }else{
            	   salary.setHydropowerSalary(new BigDecimal(hydropowerSalary));
               }
               String otherPay1=row.getCell(19).getStringCellValue();
               if(otherPay1==null||otherPay1.equals("")){
            	   salary.setOtherPay1(new BigDecimal(0));
               }else{
            	   salary.setOtherPay1(new BigDecimal(otherPay1));
               }
               String tax=row.getCell(20).getStringCellValue();
               if(tax==null||tax.equals("")){
            	   salary.setTax(new BigDecimal(0));
               }else{
            	   salary.setTax(new BigDecimal(tax));
               }
               String netPay=row.getCell(21).getStringCellValue();
               if(netPay==null||netPay.equals("")){
            	   salary.setNetPay(new BigDecimal(0));
               }else{
            	   salary.setNetPay(new BigDecimal(netPay));
               }
           } else if(userType!=null&&userType.equals("3")){
        	   salary.setUserId(row.getCell(0).getStringCellValue());
               salary.setDepartName(row.getCell(1).getStringCellValue());
               salary.setUserName(row.getCell(2).getStringCellValue());
               String positionSalary=row.getCell(3).getStringCellValue();
               if(positionSalary==null||positionSalary.equals("")){
            	   salary.setPositionSalary(new BigDecimal(0));
               }else{
            	   salary.setPositionSalary(new BigDecimal(positionSalary));
               }
               String gradeSalary=row.getCell(4).getStringCellValue();
               if(gradeSalary==null||gradeSalary.equals("")){
            	   salary.setGradeSalary(new BigDecimal(0));
               }else{
            	   salary.setGradeSalary(new BigDecimal(gradeSalary));
               }
               String baseSalary=row.getCell(5).getStringCellValue();
               if(baseSalary==null||baseSalary.equals("")){
            	   salary.setBaseSalary(new BigDecimal(0));
               }else{
            	   salary.setBaseSalary(new BigDecimal(baseSalary));
               }
               String encourageSalary=row.getCell(6).getStringCellValue();
               if(encourageSalary==null||encourageSalary.equals("")){
            	   salary.setEncourageSalary(new BigDecimal(0));
               }else{
            	   salary.setEncourageSalary(new BigDecimal(encourageSalary));
               }
               String houseSalary=row.getCell(7).getStringCellValue();
               if(houseSalary==null||houseSalary.equals("")){
            	   salary.setEncourageSalary(new BigDecimal(0));
               }else{
            	   salary.setEncourageSalary(new BigDecimal(houseSalary));
               }
               String nightSalary=row.getCell(8).getStringCellValue();
               if(nightSalary==null||nightSalary.equals("")){
            	   salary.setNightSalary(new BigDecimal(0));
               }else{
            	   salary.setNightSalary(new BigDecimal(nightSalary));
               }
               String floatSalary=row.getCell(9).getStringCellValue();
               if(floatSalary==null||floatSalary.equals("")){
            	   salary.setFloatSalary(new BigDecimal(0));
               }else{
            	   salary.setFloatSalary(new BigDecimal(floatSalary));
               }
               String healthSalary=row.getCell(10).getStringCellValue();
               if(healthSalary==null||healthSalary.equals("")){
            	   salary.setHealthSalary(new BigDecimal(0));
               }else{
            	   salary.setHealthSalary(new BigDecimal(healthSalary));
               }
               String otherPay=row.getCell(11).getStringCellValue();
               if(otherPay==null||otherPay.equals("")){
            	   salary.setOtherPay(new BigDecimal(0));
               }else{
            	   salary.setOtherPay(new BigDecimal(otherPay));
               }
               String grossSalary=row.getCell(12).getStringCellValue();
               if(grossSalary==null||grossSalary.equals("")){
            	   salary.setGrossSalary(new BigDecimal(0));
               }else{
            	   salary.setGrossSalary(new BigDecimal(grossSalary));
               }
               String memberSalary=row.getCell(13).getStringCellValue();
               if(memberSalary==null||memberSalary.equals("")){
            	   salary.setMemberSalary(new BigDecimal(0));
               }else{
            	   salary.setMemberSalary(new BigDecimal(memberSalary));
               }
               String oldPension=row.getCell(14).getStringCellValue();
               if(oldPension==null||oldPension.equals("")){
            	   salary.setOldPension(new BigDecimal(0));
               }else{
            	   salary.setOldPension(new BigDecimal(oldPension));
               }
               String unemploymentPay=row.getCell(15).getStringCellValue();
               if(unemploymentPay==null||unemploymentPay.equals("")){
            	   salary.setUnemploymentPay(new BigDecimal(0));
               }else{
            	   salary.setUnemploymentPay(new BigDecimal(unemploymentPay));
               }
               String medicalSalary=row.getCell(16).getStringCellValue();
               if(medicalSalary==null||medicalSalary.equals("")){
            	   salary.setMedicalSalary(new BigDecimal(0));
               }else{
            	   salary.setMedicalSalary(new BigDecimal(medicalSalary));
               }
               String houseFund=row.getCell(17).getStringCellValue();
               if(houseFund==null||houseFund.equals("")){
            	   salary.setHouseFund(new BigDecimal(0));
               }else{
            	   salary.setHouseFund(new BigDecimal(houseFund));
               }
               String rentPay=row.getCell(18).getStringCellValue();
               if(rentPay==null||rentPay.equals("")){
            	   salary.setRentPay(new BigDecimal(0));
               }else{
            	   salary.setRentPay(new BigDecimal(rentPay));
               }
               String hydropowerSalary=row.getCell(19).getStringCellValue();
               if(hydropowerSalary==null||hydropowerSalary.equals("")){
            	   salary.setHydropowerSalary(new BigDecimal(0));
               }else{
            	   salary.setHydropowerSalary(new BigDecimal(hydropowerSalary));
               }
               String otherPay1=row.getCell(20).getStringCellValue();
               if(otherPay1==null||otherPay1.equals("")){
            	   salary.setOtherPay1(new BigDecimal(0));
               }else{
            	   salary.setOtherPay1(new BigDecimal(otherPay1));
               }
               String tax=row.getCell(21).getStringCellValue();
               if(tax==null||tax.equals("")){
            	   salary.setTax(new BigDecimal(0));
               }else{
            	   salary.setTax(new BigDecimal(tax));
               }
               row.getCell(22).setCellType(Cell.CELL_TYPE_STRING);
               String netPay=row.getCell(22).getStringCellValue();
               if(netPay==null||netPay.equals("")){
            	   salary.setNetPay(new BigDecimal(0));
               }else{
            	   salary.setNetPay(new BigDecimal(netPay));
               }
           }
          
           //循环Excel的列
          /* for(int c = 0; c <this.totalCells; c++){    
               Cell cell = row.getCell(c);
               if (null != cell){
                   if(c==0){
                	   salary.setUserId(cell.getStringCellValue());//职工工号
                   }else if(c==1){
                	   salary.setUserName(cell.getStringCellValue());//职工工号
                   }
               }
           }*/
           salaryList.add(salary);
       }
       return salaryList;
  }
}
