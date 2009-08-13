package press.client.resource;

import com.google.gwt.core.client.GWT;

public class Press extends PressBase {
	public boolean isNewRecord() {
		return ("" + this.getId() == "");
	}
	
	/*
	 *  toJSON method that includes the base class name, required
	 *  for full JSON spec.
	 */
	public String toFullRepresentation() {
		return "\"press\": {" + toRepresentation() + "}";
	}
}