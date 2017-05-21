package base.result;

/**
 * User: liuwentao
 * Time: 14-11-15 下午4:49
 */
public class ResultBean {

    private String code;
    private String msg;

    public ResultBean() {
    }

    public ResultBean(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
