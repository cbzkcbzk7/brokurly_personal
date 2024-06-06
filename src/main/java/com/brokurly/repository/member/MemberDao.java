package com.brokurly.repository.member;


import com.brokurly.entity.member.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberDao {
    int insert(Member member);

    // mypage/info/modify
    Member selectMemberByOne(String custId);
    Member selectMemberByLogin(Member member);
    Member selectMemberBySnsId(String snsId);
    void insertSnsMember(Member member);
    int selectSnsMember(String snsId);
    String findBySnsId(String snsId);
    int countMemberAll();
    int countMemberByLogin(Member member);
    int countMember(String custId);
    int countEmail(String email);
    int emailAuthFail(String custId);
    int updateMailKey(Member member);
    int updateMailAuth(Member member);
    int updateMemberByPwd(Member member);
    int deleteMemberAll();
    int deleteMember(String custId);

}