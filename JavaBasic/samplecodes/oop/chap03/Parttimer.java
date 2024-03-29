package samplecodes.oop.chap03;

import java.math.BigDecimal;
import java.util.Scanner;

public class Parttimer {
    private BigDecimal jikyu;
    private BigDecimal kinmuJikan;
    private BigDecimal kyuJyouGaku;
    
    
    Parttimer(BigDecimal jikyu, BigDecimal kinmuJikan){
        this.jikyu = jikyu;
        this.kinmuJikan = kinmuJikan;
        this.setKyuJyouGaku();
    }
    /**
     * @return BigDecimal return the jikyu
     */
    public BigDecimal getJikyu() {
        return jikyu;
    }

    /**
     * @param jikyu the jikyu to set
     */
    public void setJikyu(BigDecimal jikyu) {
        this.jikyu = jikyu;
    }

    /**
     * @return BigDecimal return the kinmuJikan
     */
    public BigDecimal getKinmuJikan() {
        return kinmuJikan;
    }

    /**
     * @param kinmuJikan the kinmuJikan to set
     */
    public void setKinmuJikan(BigDecimal kinmuJikan) {
        this.kinmuJikan = kinmuJikan;
    }

    /**
     * @return BigDecimal return the kyuJyouGaku
     */
    public BigDecimal getKyuJyouGaku() {
        return kyuJyouGaku;
    }

    /**
     * @param kyuJyouGaku the kyuJyouGaku to set
     */
    public void setKyuJyouGaku() {
        this.kyuJyouGaku = this.jikyu.multiply(this.kinmuJikan);
    }

}
