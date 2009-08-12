package press.client.resource;

import com.kaboomerang.gwt.rest.client.resource.Resource;
import com.google.gwt.json.client.JSONObject;
import com.google.gwt.json.client.JSONParser;
import com.google.gwt.json.client.JSONString;
import com.google.gwt.json.client.JSONNumber;
import com.google.gwt.core.client.GWT;
import com.google.gwt.i18n.client.DateTimeFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.HashMap;
import java.beans.PropertyChangeListener; 
import java.beans.PropertyChangeSupport;

/*
 * Generated Base Class. Do not edit.
 *
 * Place custom code in Press.java
 *
 * Each migration will overwrite this file.
 *
 */

public class PressBase implements Resource {
    protected PropertyChangeSupport changes = new PropertyChangeSupport(this);
    protected DateTimeFormat dateTimeFormat = DateTimeFormat.getFormat("yyyy-MM-dd HH:mm:ss");
    protected String name;
    protected String size;
    protected int companyId;
    protected Date updatedAt;
    protected int washupInitialMinutes;
    protected int plateAdditionalMinutes;
    protected int id;
    protected Date createdAt;
    protected int plateInitialMinutes;
    protected int washupAdditionalMinutes;
    protected String runRates;
    
    public PressBase() {}

    public void populateFromJSONRepresentation(JSONObject json) {
        GWT.log("Populating from representation...", null);

        Iterator i;
        
        for (i = json.keySet().iterator(); i.hasNext();) {
            String key = (String) i.next();
            
            if ("name".equals(key)) {
                GWT.log("Parsing \"name\":" + json.get(key), null);
                JSONString js = json.get(key).isString();
                if (js != null) {
                    this.name = js.stringValue();
                } else {
                    this.name = "";
                }
            } else if ("size".equals(key)) {
                GWT.log("Parsing \"size\":" + json.get(key), null);
                JSONString js = json.get(key).isString();
                if (js != null) {
                    this.size = js.stringValue();
                } else {
                    this.size = "";
                }
            } else if ("company_id".equals(key)) {
                GWT.log("Parsing \"company_id\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.companyId = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.companyId = 0;
                }
            } else if ("updated_at".equals(key)) {
                GWT.log("Parsing \"updated_at\":" + json.get(key), null);
               JSONString js = json.get(key).isString();
               if (js != null) {
                   //this.updatedAt = dateTimeFormat.parse(js.stringValue());
               }
            } else if ("washup_initial_minutes".equals(key)) {
                GWT.log("Parsing \"washup_initial_minutes\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.washupInitialMinutes = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.washupInitialMinutes = 0;
                }
            } else if ("plate_additional_minutes".equals(key)) {
                GWT.log("Parsing \"plate_additional_minutes\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.plateAdditionalMinutes = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.plateAdditionalMinutes = 0;
                }
            } else if ("id".equals(key)) {
                GWT.log("Parsing \"id\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.id = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.id = 0;
                }
            } else if ("created_at".equals(key)) {
                GWT.log("Parsing \"created_at\":" + json.get(key), null);
               JSONString js = json.get(key).isString();
               if (js != null) {
                   //this.createdAt = dateTimeFormat.parse(js.stringValue());
               }
            } else if ("plate_initial_minutes".equals(key)) {
                GWT.log("Parsing \"plate_initial_minutes\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.plateInitialMinutes = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.plateInitialMinutes = 0;
                }
            } else if ("washup_additional_minutes".equals(key)) {
                GWT.log("Parsing \"washup_additional_minutes\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.washupAdditionalMinutes = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.washupAdditionalMinutes = 0;
                }
            } else if ("run_rates".equals(key)) {
                GWT.log("Parsing \"run_rates\":" + json.get(key), null);
                JSONString js = json.get(key).isString();
                if (js != null) {
                    this.runRates = js.stringValue();
                } else {
                    this.runRates = "";
                }
            }          }

          GWT.log("Finished creating from representation!", null);            
        }
    
    public void populateFromStringRepresentation(String representation) {
        JSONObject json = (JSONObject) JSONParser.parse(representation);
        populateFromJSONRepresentation(json);
    }

    public void populateFromRepresentation(String representation) {
        JSONObject json = (JSONObject) JSONParser.parse(representation);
        populateFromJSONRepresentation(json);
    }
    
    public String toRepresentation() {
        return "{" +
            "\"name\": " +
            new JSONString(name).toString() +
            ", " +
            "\"size\": " +
            new JSONString(size).toString() +
            ", " +
            "\"company_id\": " +
            companyId +
            ", " +
            "\"washup_initial_minutes\": " +
            washupInitialMinutes +
            ", " +
            "\"plate_additional_minutes\": " +
            plateAdditionalMinutes +
            ", " +
            "\"id\": " +
            id +
            ", " +
            "\"plate_initial_minutes\": " +
            plateInitialMinutes +
            ", " +
            "\"washup_additional_minutes\": " +
            washupAdditionalMinutes +
            ", " +
            "\"run_rates\": " +
            new JSONString(runRates).toString() +
            "}";
    }
    
    // Accessors

    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        String old = this.name;
        this.name = name;
        changes.firePropertyChange("name", old, name);
    }
    
    public String getSize() {
        return size;
    }
    
    public void setSize(String size) {
        String old = this.size;
        this.size = size;
        changes.firePropertyChange("size", old, size);
    }
    
    public int getCompanyId() {
        return companyId;
    }
    
    public void setCompanyId(int companyId) {
        int old = this.companyId;
        this.companyId = companyId;
        changes.firePropertyChange("companyId", old, companyId);
    }
    
    public Date getUpdatedAt() {
        return updatedAt;
    }
    
    public void setUpdatedAt(Date updatedAt) {
        Date old = this.updatedAt;
        this.updatedAt = updatedAt;
        changes.firePropertyChange("updatedAt", old, updatedAt);
    }
    
    public int getWashupInitialMinutes() {
        return washupInitialMinutes;
    }
    
    public void setWashupInitialMinutes(int washupInitialMinutes) {
        int old = this.washupInitialMinutes;
        this.washupInitialMinutes = washupInitialMinutes;
        changes.firePropertyChange("washupInitialMinutes", old, washupInitialMinutes);
    }
    
    public int getPlateAdditionalMinutes() {
        return plateAdditionalMinutes;
    }
    
    public void setPlateAdditionalMinutes(int plateAdditionalMinutes) {
        int old = this.plateAdditionalMinutes;
        this.plateAdditionalMinutes = plateAdditionalMinutes;
        changes.firePropertyChange("plateAdditionalMinutes", old, plateAdditionalMinutes);
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        int old = this.id;
        this.id = id;
        changes.firePropertyChange("id", old, id);
    }
    
    public Date getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(Date createdAt) {
        Date old = this.createdAt;
        this.createdAt = createdAt;
        changes.firePropertyChange("createdAt", old, createdAt);
    }
    
    public int getPlateInitialMinutes() {
        return plateInitialMinutes;
    }
    
    public void setPlateInitialMinutes(int plateInitialMinutes) {
        int old = this.plateInitialMinutes;
        this.plateInitialMinutes = plateInitialMinutes;
        changes.firePropertyChange("plateInitialMinutes", old, plateInitialMinutes);
    }
    
    public int getWashupAdditionalMinutes() {
        return washupAdditionalMinutes;
    }
    
    public void setWashupAdditionalMinutes(int washupAdditionalMinutes) {
        int old = this.washupAdditionalMinutes;
        this.washupAdditionalMinutes = washupAdditionalMinutes;
        changes.firePropertyChange("washupAdditionalMinutes", old, washupAdditionalMinutes);
    }
    
    public String getRunRates() {
        return runRates;
    }
    
    public void setRunRates(String runRates) {
        String old = this.runRates;
        this.runRates = runRates;
        changes.firePropertyChange("runRates", old, runRates);
    }
    
    // Property Change Support
    
    public void addPropertyChangeListener(PropertyChangeListener l) {
        changes.addPropertyChangeListener(l);
    }

    public void addPropertyChangeListener(String propertyName, PropertyChangeListener l) {
        changes.addPropertyChangeListener(propertyName, l);
    }

    public void removePropertyChangeListener(PropertyChangeListener l) {
        changes.removePropertyChangeListener(l);
    }

    public void removePropertyChangeListener(String propertyName, PropertyChangeListener l) {
        changes.removePropertyChangeListener(propertyName, l);
    }
}
