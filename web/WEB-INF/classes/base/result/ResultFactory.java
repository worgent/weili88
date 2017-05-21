package base.result;

/**
 * User: liuwentao
 * Time: 15-1-19 下午5:46
 */
public class ResultFactory {

    /**
     *
     * @return
     */
    public static ResultBean getSuccessResultBean(){
        ResultBean resultBean = new ResultBean();
        resultBean.setCode(ResultConstant.SUCCESS_CODE);
        resultBean.setMsg(ResultConstant.SUCCESS_MSG);
        return resultBean;
    }
}
