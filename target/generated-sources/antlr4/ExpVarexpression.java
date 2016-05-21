
public class ExpVarexpression extends Exp {
	String value;
	public ExpVarexpression (String val){
		value = val;
	}
	public String getvalue(){
		return value;	
	}
	
	public String toString(){
		return value.toString();	
	}
}
