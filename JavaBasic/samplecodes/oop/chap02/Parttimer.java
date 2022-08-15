package samplecodes.oop.chap02;

import java.math.BigDecimal;
import java.util.Scanner;

public class Parttimer {
    private BigDecimal jikyu;
    private BigDecimal kinmuJikan;
    private BigDecimal kyuJyouGaku;
    
   

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
