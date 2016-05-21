
public class ExpCons extends Exp{
	String value;
	public ExpCons (String val){
		value = val;
	}
	public Double getvalue(){
		Double result;
		if (value.equals("pi")){
			result = 3.14;
		}else{
			result = 2.718;
		}
		return result;	
	}
	
	public String toString(){
		return value;	
	}
}
