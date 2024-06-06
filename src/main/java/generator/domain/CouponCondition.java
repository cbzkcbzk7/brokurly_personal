//package generator.domain;
//
//import javax.validation.constraints.NotBlank;
//import javax.validation.constraints.Size;
//import javax.validation.constraints.NotNull;
//
//import java.io.Serializable;
//
//import java.util.Date;
//import io.swagger.annotations.ApiModelProperty;
//import org.hibernate.validator.constraints.Length;
//
///**
//*
//* @TableName COUPON_CONDITION
//*/
//public class CouponCondition implements Serializable {
//
//    /**
//    *
//    */
//    @NotBlank(message="[]不能为空")
//    @Size(max= 30,message="编码长度不能超过30")
//    @ApiModelProperty("")
//    @Length(max= 30,message="编码长度不能超过30")
//    private String cpnSpecId;
//    /**
//    *
//    */
//    @Size(max= 30,message="编码长度不能超过30")
//    @ApiModelProperty("")
//    @Length(max= 30,message="编码长度不能超过30")
//    private String cate;
//    /**
//    *
//    */
//    @ApiModelProperty("")
//    private Integer minOrderAmt;
//    /**
//    *
//    */
//    @Size(max= 30,message="编码长度不能超过30")
//    @ApiModelProperty("")
//    @Length(max= 30,message="编码长度不能超过30")
//    private String gradeId;
//    /**
//    *
//    */
//    @Size(max= 20,message="编码长度不能超过20")
//    @ApiModelProperty("")
//    @Length(max= 20,message="编码长度不能超过20")
//    private String payMthd;
//    /**
//    *
//    */
//    @ApiModelProperty("")
//    private Date initRegDt;
//    /**
//    *
//    */
//    @Size(max= 30,message="编码长度不能超过30")
//    @ApiModelProperty("")
//    @Length(max= 30,message="编码长度不能超过30")
//    private String initRegId;
//    /**
//    *
//    */
//    @ApiModelProperty("")
//    private Date lastModiDt;
//    /**
//    *
//    */
//    @Size(max= 30,message="编码长度不能超过30")
//    @ApiModelProperty("")
//    @Length(max= 30,message="编码长度不能超过30")
//    private String lastModiId;
//
//    /**
//    *
//    */
//    private void setCpnSpecId(String cpnSpecId){
//    this.cpnSpecId = cpnSpecId;
//    }
//
//    /**
//    *
//    */
//    private void setCate(String cate){
//    this.cate = cate;
//    }
//
//    /**
//    *
//    */
//    private void setMinOrderAmt(Integer minOrderAmt){
//    this.minOrderAmt = minOrderAmt;
//    }
//
//    /**
//    *
//    */
//    private void setGradeId(String gradeId){
//    this.gradeId = gradeId;
//    }
//
//    /**
//    *
//    */
//    private void setPayMthd(String payMthd){
//    this.payMthd = payMthd;
//    }
//
//    /**
//    *
//    */
//    private void setInitRegDt(Date initRegDt){
//    this.initRegDt = initRegDt;
//    }
//
//    /**
//    *
//    */
//    private void setInitRegId(String initRegId){
//    this.initRegId = initRegId;
//    }
//
//    /**
//    *
//    */
//    private void setLastModiDt(Date lastModiDt){
//    this.lastModiDt = lastModiDt;
//    }
//
//    /**
//    *
//    */
//    private void setLastModiId(String lastModiId){
//    this.lastModiId = lastModiId;
//    }
//
//
//    /**
//    *
//    */
//    private String getCpnSpecId(){
//    return this.cpnSpecId;
//    }
//
//    /**
//    *
//    */
//    private String getCate(){
//    return this.cate;
//    }
//
//    /**
//    *
//    */
//    private Integer getMinOrderAmt(){
//    return this.minOrderAmt;
//    }
//
//    /**
//    *
//    */
//    private String getGradeId(){
//    return this.gradeId;
//    }
//
//    /**
//    *
//    */
//    private String getPayMthd(){
//    return this.payMthd;
//    }
//
//    /**
//    *
//    */
//    private Date getInitRegDt(){
//    return this.initRegDt;
//    }
//
//    /**
//    *
//    */
//    private String getInitRegId(){
//    return this.initRegId;
//    }
//
//    /**
//    *
//    */
//    private Date getLastModiDt(){
//    return this.lastModiDt;
//    }
//
//    /**
//    *
//    */
//    private String getLastModiId(){
//    return this.lastModiId;
//    }
//
//}
