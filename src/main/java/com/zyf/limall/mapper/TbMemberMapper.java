package com.zyf.limall.mapper;

import com.zyf.limall.pojo.TbMember;
import com.zyf.limall.pojo.TbMemberExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbMemberMapper {
    long countByExample(TbMemberExample example);

    int deleteByExample(TbMemberExample example);

    int deleteByPrimaryKey(String uid);

    int insert(TbMember record);

    int insertSelective(TbMember record);

    List<TbMember> selectByExample(TbMemberExample example);

    TbMember selectByPrimaryKey(String uid);

    int updateByExampleSelective(@Param("record") TbMember record, @Param("example") TbMemberExample example);

    int updateByExample(@Param("record") TbMember record, @Param("example") TbMemberExample example);

    int updateByPrimaryKeySelective(TbMember record);

    int updateByPrimaryKey(TbMember record);
}