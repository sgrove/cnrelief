package press.client.resource;

import com.kaboomerang.gwt.rest.client.resource.Resource;
import com.google.gwt.json.client.JSONObject;
import com.google.gwt.json.client.JSONParser;
import com.google.gwt.json.client.JSONString;
import com.google.gwt.json.client.JSONNumber;
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
    protected int makeReadySheets;
    protected int minimumRunRate;
    protected String name;
    protected int embossMinutes;
    protected String size;
    protected int companyId;
    protected Date updatedAt;
    protected int washupInitialMinutes;
    protected double presses;
    protected int plateAdditionalMinutes;
    protected double discountHours;
    protected int id;
    protected int normalRunRate;
    protected Date createdAt;
    protected int kissCutMinutes;
    protected int plateInitialMinutes;
    protected int washupAdditionalMinutes;
    protected double discountPercentage;
    protected int dieCutMinutes;
    protected String runRates;
    protected int foilMinutes;
    
    public PressBase() {}
    
    public void populateFromRepresentation(String representation) {
        JSONObject json = (JSONObject) JSONParser.parse(representation);
        Iterator i;
        
        for (i = json.keySet().iterator(); i.hasNext();) {
            String key = (String) i.next();
            
            if ("make_ready_sheets".equals(key)) {
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.makeReadySheets = new Double(json.get(key).isNumber().getValue()).intValue();
                } else {
                    this.makeReadySheets = 0;
                }
            } else if ("minimum_run_rate".equals(key)) {
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.minimumRunRate = new Double(json.get(key).isNumber().getValue()).intValue();
                } else {
                    this.minimumRunRate = 0;
                }
            } else if ("name".equals(key)) {
                JSONString js = json.get(key).isString();
                if (js != null) {
                    this.name = js.stringValue();
                } else {
                    this.name = "";
                }
            } else if ("emboss_minutes".equals(key)) {
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.embossMinutes = new Double(json.get(key).isNumber().getValue()).intValue();
                } else {
                    this.embossMinutes = 0;
                }
            } else if ("size".equals(key)) {
                JSONString js = json.get(key).isString();
                if (js != null) {
                    this.size = js.stringValue();
                } else {
                    this.size = "";
                }
            } else if ("company_id".equals(key)) {
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.companyId = new Double(json.get(key).isNumber().getValue()).intValue();
                } else {
                    this.companyId = 0;
                }
            } else if ("updated_at".equals(key)) {
               JSONString js = json.get(key).isString();
               if (js != null) {
                   this.updatedAt = dateTimeFormat.parse(js.stringValue());
               }
            } else if ("washup_initial_minutes".equals(key)) {
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.washupInitialMinutes = new Double(json.get(key).isNumber().getValue()).intValue();
                } else {
                    this.washupInitialMinutes = 0;
                }
            } else if ("presses".equals(key)) {
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.presses = json.get(key).isNumber().getValue();
                } else {
                    this.presses = 0;
                }
            } else if ("plate_additional_minutes".equals(key)) {
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.plateAdditionalMinutes = new Double(json.get(key).isNumber().getValue()).intValue();
                } else {
                    this.plateAdditionalMinutes = 0;
                }
            } else if ("discount_hours".equals(key)) {
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.discountHours = json.get(key).isNumber().getValue();
                } else {
                    this.discountHours = 0;
                }
            } else if ("id".equals(key)) {
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.id = new Double(json.get(key).isNumber().getValue()).intValue();
                } else {
                    this.id = 0;
                }
            } else if ("normal_run_rate".equals(key)) {
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.normalRunRate = new Double(json.get(key).isNumber().getValue()).intValue();
                } else {
                    this.normalRunRate = 0;
                }
            } else if ("created_at".equals(key)) {
               JSONString js = json.get(key).isString();
               if (js != null) {
                   this.createdAt = dateTimeFormat.parse(js.stringValue());
               }
            } else if ("kiss_cut_minutes".equals(key)) {
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.kissCutMinutes = new Double(json.get(key).isNumber().getValue()).intValue();
                } else {
                    this.kissCutMinutes = 0;
                }
            } else if ("plate_initial_minutes".equals(key)) {
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.plateInitialMinutes = new Double(json.get(key).isNumber().getValue()).intValue();
                } else {
                    this.plateInitialMinutes = 0;
                }
            } else if ("washup_additional_minutes".equals(key)) {
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.washupAdditionalMinutes = new Double(json.get(key).isNumber().getValue()).intValue();
                } else {
                    this.washupAdditionalMinutes = 0;
                }
            } else if ("discount_percentage".equals(key)) {
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.discountPercentage = json.get(key).isNumber().getValue();
                } else {
                    this.discountPercentage = 0;
                }
            } else if ("die_cut_minutes".equals(key)) {
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.dieCutMinutes = new Double(json.get(key).isNumber().getValue()).intValue();
                } else {
                    this.dieCutMinutes = 0;
                }
            } else if ("run_rates".equals(key)) {
                JSONString js = json.get(key).isString();
                if (js != null) {
                    this.runRates = js.stringValue();
                } else {
                    this.runRates = "";
                }
            } else if ("foil_minutes".equals(key)) {
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.foilMinutes = new Double(json.get(key).isNumber().getValue()).intValue();
                } else {
                    this.foilMinutes = 0;
                }
            }            
        }
    }
    
    public String toRepresentation() {
        return "{" +
            "\"make_ready_sheets\": " +
            makeReadySheets +
            ", " +
            "\"minimum_run_rate\": " +
            minimumRunRate +
            ", " +
            "\"name\": " +
            new JSONString(name).toString() +
            ", " +
            "\"emboss_minutes\": " +
            embossMinutes +
            ", " +
            "\"size\": " +
            new JSONString(size).toString() +
            ", " +
            "\"company_id\": " +
            companyId +
            ", " +
            "\"updated_at\": " +
            new JSONString(dateTimeFormat.format(updatedAt)).toString() +
            ", " +
            "\"washup_initial_minutes\": " +
            washupInitialMinutes +
            ", " +
            "\"presses\": " +
            new JSONNumber(presses).toString() +
            ", " +
            "\"plate_additional_minutes\": " +
            plateAdditionalMinutes +
            ", " +
            "\"discount_hours\": " +
            new JSONNumber(discountHours).toString() +
            ", " +
            "\"id\": " +
            id +
            ", " +
            "\"normal_run_rate\": " +
            normalRunRate +
            ", " +
            "\"created_at\": " +
            new JSONString(dateTimeFormat.format(createdAt)).toString() +
            ", " +
            "\"kiss_cut_minutes\": " +
            kissCutMinutes +
            ", " +
            "\"plate_initial_minutes\": " +
            plateInitialMinutes +
            ", " +
            "\"washup_additional_minutes\": " +
            washupAdditionalMinutes +
            ", " +
            "\"discount_percentage\": " +
            new JSONNumber(discountPercentage).toString() +
            ", " +
            "\"die_cut_minutes\": " +
            dieCutMinutes +
            ", " +
            "\"run_rates\": " +
            new JSONString(runRates).toString() +
            ", " +
            "\"foil_minutes\": " +
            foilMinutes +
            "}";
    }
    
    // Accessors

    public int getMakeReadySheets() {
        return makeReadySheets;
    }
    
    public void setMakeReadySheets(int makeReadySheets) {
        int old = this.makeReadySheets;
        this.makeReadySheets = makeReadySheets;
        changes.firePropertyChange("makeReadySheets", old, makeReadySheets);
    }
    
    public int getMinimumRunRate() {
        return minimumRunRate;
    }
    
    public void setMinimumRunRate(int minimumRunRate) {
        int old = this.minimumRunRate;
        this.minimumRunRate = minimumRunRate;
        changes.firePropertyChange("minimumRunRate", old, minimumRunRate);
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        String old = this.name;
        this.name = name;
        changes.firePropertyChange("name", old, name);
    }
    
    public int getEmbossMinutes() {
        return embossMinutes;
    }
    
    public void setEmbossMinutes(int embossMinutes) {
        int old = this.embossMinutes;
        this.embossMinutes = embossMinutes;
        changes.firePropertyChange("embossMinutes", old, embossMinutes);
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
    
    public double getPresses() {
        return presses;
    }
    
    public void setPresses(double presses) {
        double old = this.presses;
        this.presses = presses;
        changes.firePropertyChange("presses", old, presses);
    }
    
    public int getPlateAdditionalMinutes() {
        return plateAdditionalMinutes;
    }
    
    public void setPlateAdditionalMinutes(int plateAdditionalMinutes) {
        int old = this.plateAdditionalMinutes;
        this.plateAdditionalMinutes = plateAdditionalMinutes;
        changes.firePropertyChange("plateAdditionalMinutes", old, plateAdditionalMinutes);
    }
    
    public double getDiscountHours() {
        return discountHours;
    }
    
    public void setDiscountHours(double discountHours) {
        double old = this.discountHours;
        this.discountHours = discountHours;
        changes.firePropertyChange("discountHours", old, discountHours);
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        int old = this.id;
        this.id = id;
        changes.firePropertyChange("id", old, id);
    }
    
    public int getNormalRunRate() {
        return normalRunRate;
    }
    
    public void setNormalRunRate(int normalRunRate) {
        int old = this.normalRunRate;
        this.normalRunRate = normalRunRate;
        changes.firePropertyChange("normalRunRate", old, normalRunRate);
    }
    
    public Date getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(Date createdAt) {
        Date old = this.createdAt;
        this.createdAt = createdAt;
        changes.firePropertyChange("createdAt", old, createdAt);
    }
    
    public int getKissCutMinutes() {
        return kissCutMinutes;
    }
    
    public void setKissCutMinutes(int kissCutMinutes) {
        int old = this.kissCutMinutes;
        this.kissCutMinutes = kissCutMinutes;
        changes.firePropertyChange("kissCutMinutes", old, kissCutMinutes);
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
    
    public double getDiscountPercentage() {
        return discountPercentage;
    }
    
    public void setDiscountPercentage(double discountPercentage) {
        double old = this.discountPercentage;
        this.discountPercentage = discountPercentage;
        changes.firePropertyChange("discountPercentage", old, discountPercentage);
    }
    
    public int getDieCutMinutes() {
        return dieCutMinutes;
    }
    
    public void setDieCutMinutes(int dieCutMinutes) {
        int old = this.dieCutMinutes;
        this.dieCutMinutes = dieCutMinutes;
        changes.firePropertyChange("dieCutMinutes", old, dieCutMinutes);
    }
    
    public String getRunRates() {
        return runRates;
    }
    
    public void setRunRates(String runRates) {
        String old = this.runRates;
        this.runRates = runRates;
        changes.firePropertyChange("runRates", old, runRates);
    }
    
    public int getFoilMinutes() {
        return foilMinutes;
    }
    
    public void setFoilMinutes(int foilMinutes) {
        int old = this.foilMinutes;
        this.foilMinutes = foilMinutes;
        changes.firePropertyChange("foilMinutes", old, foilMinutes);
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
