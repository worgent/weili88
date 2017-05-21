package base.tool.excel;

import base.util.BaseDateUtil;
import org.apache.axis.utils.StringUtils;
import org.apache.poi.hssf.usermodel.*;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * POI读取EXCEL
 *
 * @author liuwentao
 *
 */
public class ExcelRead {

	public ExcelRead() {
	}

	public static List<List> readExcel(String fileName) throws Exception {
		List<List> list = new ArrayList<List>();
		InputStream myxls = null;
		HSSFWorkbook wb = null;
		try {
			int cols = 0;
			myxls = new FileInputStream(fileName);
			wb = new HSSFWorkbook(myxls);
			HSSFSheet sheet = wb.getSheetAt(0); // 第一个工作表
			List listRow = null;

			for (int i = 0; i < sheet.getLastRowNum()+1; i++) {
				listRow = new ArrayList();
				HSSFRow row = sheet.getRow(i); // 循环得到行
				if(row == null)
					break;
				if(cols == 0)
					cols = row.getLastCellNum(); // 最后一个单元格的列号
				for (int j = 0; j < cols; j++) {
					HSSFCell cell = row.getCell((short) j); // 循环得到单元格
					if (null == cell) {
						listRow.add("");
					} else {
						switch (cell.getCellType()) {
						case HSSFCell.CELL_TYPE_BLANK: // 空白类型
							listRow.add("");
							break;
						case HSSFCell.CELL_TYPE_NUMERIC: // 是数字类型
							// 读取日期类型
							HSSFDataFormat df = wb.createDataFormat();

							if (HSSFDateUtil.isCellDateFormatted(cell) || df.getFormat(cell.getCellStyle().getDataFormat()).indexOf("m") != -1
				             || df.getFormat(cell.getCellStyle().getDataFormat()).indexOf("y") != -1)
							{
								Date date = cell.getDateCellValue();
                                String day = BaseDateUtil.getFormatStringDay(date);
								listRow.add(day);
							}
							else
							{
								Double db = cell.getNumericCellValue();
								//如果输入数据过大或过小而显示为科学计数时，转换为正常的数字字符串
								String tempStr = String.valueOf(db);
								if((tempStr.indexOf('e') != -1) || (tempStr.indexOf("E") != -1))
								{
									DecimalFormat format = (DecimalFormat) NumberFormat.getPercentInstance();
									format.applyPattern("#####0");
									listRow.add(format.format(db));
								}
								else
								{
									//判断是否为整数
									long lg = db.longValue();
									if(lg != db)
										listRow.add(tempStr.trim());
									else
										listRow.add(lg);
								}
							}
							break;
						case HSSFCell.CELL_TYPE_STRING: // 字符串类型
							listRow.add((cell.getRichStringCellValue().toString()).trim());
							break;
						case HSSFCell.CELL_TYPE_BOOLEAN: // 如果是Boolean
							listRow.add(cell.getBooleanCellValue());
							break;
						case HSSFCell.CELL_TYPE_FORMULA: // 公式
							listRow.add(cell.getCellFormula());
							break;
						case HSSFCell.CELL_TYPE_ERROR: // 错误
							listRow.add(cell.getErrorCellValue());
							break;
						default:
							break;
						}
					}
				}

				if(!isBlankList(listRow))
					list.add(listRow);
			}
		} catch (FileNotFoundException e) {
			throw new Exception("不存在此文件");
		} catch (IOException e) {
			throw new Exception("读EXCEL文件出错");
		} finally {
			if (myxls != null) {
				try {
					myxls.close();
				} catch (IOException e) {
					myxls = null;
				}
			}
		}
		return list;
	}
	//判断是否为空
	private static boolean isBlankList(List list)
	{
		for(int i=0; i<list.size();i++)
		{
			if((list.get(i) != null) &&
			!StringUtils.isEmpty(list.get(i).toString()))
				return false;
		}
		return true;
	}

	public static void main(String[] args) {
		try {
			List<List> list = ExcelRead.readExcel("C://mywork/bms.xls");
			for(int i=0;i<list.size();i++){
			    List li = list.get(i);
			    for(int j = 0;j<li.size();j++){
			        System.out.println("list["+i+"]["+j+"]="+li.get(j));
			    }
			}
			System.out.println("ok");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
