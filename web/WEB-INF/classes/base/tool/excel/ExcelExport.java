/*
 * 文件名： ExcelExport.java
 *
 * 创建日期： 2012-2-5
 *
 * Copyright(C) 2012, by yangxin.
 *
 * 原始作者: <a href="mailto:yangxin@huimai.com">yangxin</a>
 *
 */
package base.tool.excel;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Map.Entry;


/**
 * <b>List导出excel功能</b> <br>
 * 支持List->JavaBean和List->Map类型导出
 *
 */
public class ExcelExport {

    /** The List row typebean. */
    private String ListRowTYPEBEAN = "BEAN";

    /** The LISTROWTYPEMAP. */
    private String LISTROWTYPEMAP = "MAP";

    /** The date fomart. */
    private String dateFomart = "yyyy-MM-dd";

    /** The headers. */
    private LinkedHashMap<String, String> headers = new LinkedHashMap<String, String>();

    /**
     * Export excel.
     *
     * @param l
     *            the l
     * @param out
     *            the out
     */
    public void exportExcel(List<?> l, OutputStream out) {
        exportExcel("产品系统数据导出", null, l, out, "yyyy-MM-dd", ListRowTYPEBEAN);
    }

    /**
     * Export excel.
     *
     * @param headers
     *            the headers
     * @param l
     *            the l
     * @param out
     *            the out
     */
    public void exportExcel(LinkedHashMap<String, String> headers, List<?> l, OutputStream out) {
        exportExcel("产品系统数据导出", headers, l, out, "yyyy-MM-dd", ListRowTYPEBEAN);
    }

    /**
     *
     * @param headers
     * @param l
     * @param out
     * @param dateFormatString
     */
    public void exportExcel(LinkedHashMap<String, String> headers, List<?> l, OutputStream out, String dateFormatString) {
        exportExcel("产品系统数据导出", headers, l, out, dateFormatString, ListRowTYPEBEAN);
    }

    /**
     *
     * @param title
     * @param headers
     * @param l
     * @param out
     * @param dateFormatString
     * @param rowType
     */
    @SuppressWarnings("unchecked")
    public void exportExcel(String title, LinkedHashMap<String, String> headers, List<?> l, OutputStream out,
            String dateFormatString, String rowType) {
        // 声明一个工作薄
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 生成一个表格
        HSSFSheet sheet = workbook.createSheet(title);
        // 设置表格默认列宽度为15个字节
        sheet.setDefaultColumnWidth(30);
        // 标题样式定义
        HSSFCellStyle style = setStyle(workbook);
        // 内容样式定义
        HSSFCellStyle styleBody = setStyleBody(workbook, style);
        // 产生表格标题行
        HSSFRow row = sheet.createRow(0);
        setHeaders(headers);
        setDateFomart(dateFomart);

        row = createTitle(headers, style, row);
        try {
            createData(l, sheet, styleBody, rowType);
            workbook.write(out);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * Sets the style body.
     *
     * @param workbook
     *            the workbook
     * @param style
     *            the style
     * @return the hSSF cell style
     */
    private HSSFCellStyle setStyleBody(HSSFWorkbook workbook, HSSFCellStyle style) {
        HSSFCellStyle style2 = setFont(workbook, style);
        // 生成另一个字体
        HSSFFont font2 = workbook.createFont();
        font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        // 把字体应用到当前的样式
        style2.setFont(font2);
        return style2;
    }

    /**
     * Creates the data.
     *
     * @param l
     *            the l
     * @param sheet
     *            the sheet
     * @param style2
     *            the style2
     * @param rowType
     *            the row type
     * @throws Exception
     *             the exception
     */
    private void createData(List l, HSSFSheet sheet, HSSFCellStyle style2, String rowType) throws Exception {

        HSSFRow row = null;
        int index = 0;
        for (Object o : l) {
            index++;
            row = sheet.createRow(index);
            createDataRow(style2, row, o, rowType);
        }
    }

    /**
     * Creates the data row.
     *
     * @param style2
     *            the style2
     * @param row
     *            the row
     * @param o
     *            the o
     * @param objType
     *            the obj type
     * @throws Exception
     *             the exception
     */
    private void createDataRow(HSSFCellStyle style2, HSSFRow row, Object o, String objType) throws Exception {

        if (ListRowTYPEBEAN.equals(objType)) {
            Class cla = o.getClass();
            Field[] fields = cla.getDeclaredFields();
            int i = 0;
            Iterator it = headers.entrySet().iterator();
            while (it.hasNext()) {
                Entry<String, String> entry = (Entry) it.next();
                String value = entry.getValue();
                for (Field f : fields) {
                    if (value.equals(f.getName())) {
                        HSSFCell cell = row.createCell(i);
                        cell.setCellStyle(style2);
                        f.setAccessible(true);
                        try {
                            f.set(o, f.get(o));
                        } catch (IllegalAccessException e) {
                            continue;
                        }
                        setCellValueByFieldType(o, f, cell);
                        i++;
                    }
                }
            }

        } else if (LISTROWTYPEMAP.equals(objType)) {
            HashMap<String, Object> map = (HashMap) o;
            Iterator it = headers.entrySet().iterator();
            int i = 0;
            while (it.hasNext()) {
                Entry<String, String> entry = (Entry) it.next();
                String value = entry.getValue();
                Iterator ito = map.entrySet().iterator();
                while (ito.hasNext()) {
                    Entry<String, Object> entryo = (Entry) ito.next();
                    String valueo = entryo.getKey();
//                    System.out.println("value:" + value + "valo:" + valueo);
                    if (value.endsWith(valueo)) {
                        HSSFCell cell = row.createCell(i);
                        cell.setCellStyle(style2);
                        // 目前无法取得Map(k,v)中value对象类型默认全都是String类型处理
                        if (entryo.getValue() instanceof Date) {
                            SimpleDateFormat sdf = new SimpleDateFormat(dateFomart);
                            cell.setCellValue(sdf.format((Date) entryo.getValue()));
                        } else {
                            cell.setCellValue(String.valueOf(entryo.getValue()));
                        }

                        i++;
                    }
                }
            }

        }

    }

    /**
     * Sets the cell value by field type.
     *
     * @param o
     *            the o
     * @param f
     *            the f
     * @param cell
     *            the cell
     * @throws IllegalAccessException
     *             the illegal access exception
     */
    private void setCellValueByFieldType(Object o, Field f, HSSFCell cell) throws IllegalAccessException {
        String textValue;
        if (f.getType() == Date.class) {
            Date date = (Date) f.get(o);
            SimpleDateFormat sdf = new SimpleDateFormat(dateFomart);
            textValue = sdf.format(date);
            cell.setCellValue(textValue);
        } else if (f.getType() == boolean.class) {
            boolean bValue = (Boolean) f.get(o);
            cell.setCellValue(bValue);
        } else if (f.getType() == String.class) {
            textValue = (String) f.get(o);
            cell.setCellValue(textValue);
        } else if (f.getType() == long.class) {
            long longValue = (Long) f.get(o);
            cell.setCellValue(longValue);
        } else if (f.getType() == int.class) {
            int value = (Integer) f.get(o);
            cell.setCellValue(value);
        } else if (f.getType() == double.class) {
            double value = (Double) f.get(o);
            cell.setCellValue(value);
        } else if (f.getType() == float.class) {
            float value = (Float) f.get(o);
            cell.setCellValue(value);
        } else {
            cell.setCellValue(f.getType().toString());
        }
    }

    /**
     * Creates the title.
     *
     * @param headers
     *            the headers
     * @param style
     *            the style
     * @param row
     *            the row
     * @return the hSSF row
     */
    private HSSFRow createTitle(LinkedHashMap<String, String> headers, HSSFCellStyle style, HSSFRow row) {

        Iterator it = headers.entrySet().iterator();
        int index = 0;
        while (it.hasNext()) {
            Entry<String, String> entry = (Entry) it.next();
            HSSFCell cell = row.createCell(index);
//            System.out.println(entry.getKey());


            cell.setCellStyle(style);
            cell.setCellValue(new HSSFRichTextString(entry.getKey()));
            index++;
        }
        return row;
    }

    /**
     * Sets the font.
     *
     * @param workbook
     *            the workbook
     * @param style
     *            the style
     * @return the hSSF cell style
     */
    private HSSFCellStyle setFont(HSSFWorkbook workbook, HSSFCellStyle style) {
        HSSFFont font = workbook.createFont();
        font.setColor(HSSFColor.VIOLET.index);
        font.setFontHeightInPoints((short) 12);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        // 把字体应用到当前的样式
        style.setFont(font);
        // 生成并设置另一个样式
        HSSFCellStyle style2 = workbook.createCellStyle();
        style2.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
        style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        return style2;
    }

    /**
     * Sets the style.
     *
     * @param workbook
     *            the workbook
     * @return the hSSF cell style
     */
    private HSSFCellStyle setStyle(HSSFWorkbook workbook) {
        HSSFCellStyle style = workbook.createCellStyle();
        // 设置这些样式
        style.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        return style;
    }

    /**
     * Gets the date fomart.
     *
     * @return the date fomart
     */
    public String getDateFomart() {
        return dateFomart;
    }

    /**
     * Sets the date fomart.
     *
     * @param dateFomart
     *            the new date fomart
     */
    public void setDateFomart(String dateFomart) {
        this.dateFomart = dateFomart;
    }

    /**
     * Gets the headers.
     *
     * @return the headers
     */
    public LinkedHashMap<String, String> getHeaders() {
        return headers;
    }

    /**
     * Sets the headers.
     *
     * @param headers
     *            the headers
     */
    public void setHeaders(LinkedHashMap<String, String> headers) {
        this.headers = headers;
    }

    /**
     * The main method.
     *
     * @param args
     *            the arguments
     */
    public static void main(String[] args) {
        // 测试学生
        ExcelExport ex = new ExcelExport();
        LinkedHashMap<String, String> headers = new LinkedHashMap<String, String>();
        headers.put("学号", "id");
        headers.put("姓名", "name");
        headers.put("年龄", "age");
        headers.put("性别", "sex");
        headers.put("出生日期", "birthday");

        List<DemoBean> dataset = new ArrayList<DemoBean>();
        dataset.add(new DemoBean(10000001, "张三", 20, true, new Date()));
        dataset.add(new DemoBean(20000002, "李四", 24, false, new Date()));
        dataset.add(new DemoBean(30000003, "王五", 22, true, new Date()));

        List<Map> dataset2 = new ArrayList<Map>();

        Map a1 = new HashMap<String, Object>();
        a1.put("id", 10000001);
        a1.put("name", "王五");
        a1.put("age", 22);
        a1.put("sex", true);
        a1.put("birthday", new Date());
        dataset2.add(a1);
        Map a2 = new HashMap<String, Object>();
        a2.put("id", 10000001);
        a2.put("name", "王五");
        a2.put("age", 22);
        a2.put("sex", true);
        a2.put("birthday", new Date());
        dataset2.add(a2);
        Map a3 = new HashMap<String, Object>();
        a3.put("id", 10000001);
        a3.put("name", "王五");
        a3.put("age", 22);
        a3.put("sex", true);
        a3.put("birthday", new Date());
        dataset2.add(a3);

        // 测试图书
        try {
            OutputStream out = new FileOutputStream("E://a.xls");
            ex.exportExcel(headers, dataset, out);
            System.out.println("excel导出成功！");
            OutputStream out1 = new FileOutputStream("E://b.xls");
            ex.exportExcel("List->Map测试", headers, dataset2, out1, "yyyy-MM-DD", "MAP");
            System.out.println("excel导出成功！");

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
