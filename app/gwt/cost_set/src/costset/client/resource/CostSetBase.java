package costset.client.resource;

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
 * Place custom code in CostSet.java
 *
 * Each migration will overwrite this file.
 *
 */

public class CostSetBase implements Resource {
    protected PropertyChangeSupport changes = new PropertyChangeSupport(this);
    protected DateTimeFormat dateTimeFormat = DateTimeFormat.getFormat("yyyy-MM-dd HH:mm:ss");
    protected String name;
    protected int companyId;
    protected Date updatedAt;
    protected int id;
    protected Date createdAt;
    
    public CostSetBase() {}

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
            "\"company_id\": " +
            companyId +
            ", " +
            "\"updated_at\": " +
            new JSONString(dateTimeFormat.format(updatedAt)).toString() +
            ", " +
            "\"id\": " +
            id +
            ", " +
            "\"created_at\": " +
            new JSONString(dateTimeFormat.format(createdAt)).toString() +
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
