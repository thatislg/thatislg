package samplecodes.oop.chap03;

public class DiscomfortIndex {
    private Integer temperature;
    private Integer humidity;

    public DiscomfortIndex(int temperature2, int humidity2) {
    }

    /**
     * @return Integer return the temperature
     */
    public Integer getTemperature() {
        return temperature;
    }

    /**
     * @param temperature the temperature to set
     */
    public void setTemperature(Integer temperature) {
        this.temperature = temperature;
    }

    /**
     * @return Integer return the humidity
     */
    public Integer getHumidity() {
        return humidity;
    }

    /**
     * @param humidity the humidity to set
     */
    public void setHumidity(Integer humidity) {
        this.humidity = humidity;
    }

    public String indexValue() {
        return null;
    }

    public String feel() {
        return null;
    }

}
