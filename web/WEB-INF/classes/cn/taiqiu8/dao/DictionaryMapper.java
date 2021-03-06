package cn.taiqiu8.dao;

import cn.taiqiu8.model.Dictionary;
import cn.taiqiu8.model.DictionaryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DictionaryMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dictionary
     *
     * @mbggenerated
     */
    int countByExample(DictionaryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dictionary
     *
     * @mbggenerated
     */
    int deleteByExample(DictionaryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dictionary
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dictionary
     *
     * @mbggenerated
     */
    int insert(Dictionary record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dictionary
     *
     * @mbggenerated
     */
    int insertSelective(Dictionary record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dictionary
     *
     * @mbggenerated
     */
    List<Dictionary> selectByExample(DictionaryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dictionary
     *
     * @mbggenerated
     */
    Dictionary selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dictionary
     *
     * @mbggenerated
     */
    int updateByExampleSelective(@Param("record") Dictionary record, @Param("example") DictionaryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dictionary
     *
     * @mbggenerated
     */
    int updateByExample(@Param("record") Dictionary record, @Param("example") DictionaryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dictionary
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Dictionary record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dictionary
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Dictionary record);
}