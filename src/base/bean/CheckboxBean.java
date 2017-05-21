package base.bean;

/**
 * User: liuwentao@kongzhong.com
 * Time: 12-10-11 上午9:51
 */
public class CheckboxBean extends BaseBean{
    private String value;
    private String name;
    private boolean checked;

    public CheckboxBean() {
    }


    public CheckboxBean(String name, String value) {
        this.name = name;
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public static void main(String[] args) {

        System.out.println(new CheckboxBean("test","valuetest"));
    }
}
