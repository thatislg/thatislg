package chap03;

import java.math.BigDecimal;

public class Employee {

    Employee(BigDecimal kinZokuNenSuu) {
        this.kinZokuNenSuu = kinZokuNenSuu;
        this.setSyouKyuKeiSuu(this.kinZokuNenSuu);
        this.setKyuuYoGaku();
    }

    private BigDecimal kinZokuNenSuu; // 勤続年数

    public BigDecimal getKinZokuNenSuu() {
        return kinZokuNenSuu;
    }

    public void setKinZokuNenSuu(BigDecimal kinZokuNenSuu) {
        this.kinZokuNenSuu = kinZokuNenSuu;
    }

    private BigDecimal syouKyuKeiSuu; // 昇給係数

    public BigDecimal getSyouKyuKeiSuu() {
        return syouKyuKeiSuu;
    }

    public void setSyouKyuKeiSuu(BigDecimal kinZokuNenSuu) {
        if (kinZokuNenSuu.compareTo(new BigDecimal("10")) == 1) {
            this.syouKyuKeiSuu = new BigDecimal("20000");
        } else {
            this.syouKyuKeiSuu = new BigDecimal("10000");
        }

    }

    
    private final BigDecimal syoNinKyu = new BigDecimal("210000"); // 初任給

    private BigDecimal kyuuYoGaku; // 給与額

    public BigDecimal getKyuuYoGaku() {
        return kyuuYoGaku;
    }

    public void setKyuuYoGaku() {
        // Với số năm <= 10, 
        if (this.syouKyuKeiSuu.compareTo(new BigDecimal("10000")) == 0) {
            //tiền lương =  tiền lương cơ bản + số năm liên tiếp * hệ số
            this.kyuuYoGaku = this.syoNinKyu.add(
                    this.syouKyuKeiSuu.multiply(
                            this.kinZokuNenSuu));
        } else {
        // Với số năm > 10, 
            // Phần tăng lương từ năm thứ 10 = số năm tính từ năm thứ 10 * hệ số
            BigDecimal jyuuNenIJyouNoBun = this.kinZokuNenSuu.subtract(new BigDecimal("10")).multiply(this.syouKyuKeiSuu);
            
            //tiền lương =  tiền lương cơ bản + phần tăng lương từ năm thứ 10 + 10 man
            this.kyuuYoGaku = this.syoNinKyu.add(
                    jyuuNenIJyouNoBun).add(new BigDecimal("100000"));
        }

    }
}
