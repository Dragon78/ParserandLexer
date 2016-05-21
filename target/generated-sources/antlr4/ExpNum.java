
public class ExpNum extends Exp {
	private double value;
	
	public ExpNum (String val){
		value = Double.parseDouble(val);
	}
	public double getvalue(){
		return value;	
	}
	
	public String toString(){
		return (String) new Double(value).toString();	
	}

}
