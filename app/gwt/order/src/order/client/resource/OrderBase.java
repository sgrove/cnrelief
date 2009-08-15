package order.client.resource;

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
 * Place custom code in Order.java
 *
 * Each migration will overwrite this file.
 *
 */

public class OrderBase implements Resource {
    protected PropertyChangeSupport changes = new PropertyChangeSupport(this);
    protected DateTimeFormat dateTimeFormat = DateTimeFormat.getFormat("yyyy-MM-dd HH:mm:ss");
    protected Date quotedOn;
    protected int jobId;
    protected String finishFoldSize;
    protected String turnaround;
    protected String finishFlatSize;
    protected int numberOfParts;
    protected int consecutiveStart;
    protected int quantityOrdered;
    protected Date updatedAt;
    protected Date orderedOn;
    protected int finalQuantity;
    protected Date dueBy;
    protected int quanitityOvers;
    protected int entryId;
    protected int quoteNumber;
    protected int oversOnShelf;
    protected int costSetId;
    protected int id;
    protected String proof;
    protected String formNumber;
    protected String type;
    protected Date createdAt;
    protected boolean billingOnHold;
    protected int contactId;
    protected int estimatorId;
    protected int consecutiveEnd;
    protected String description;
    protected int billerId;
    protected String status;
    protected String po;
    protected int csrId;
    
    public OrderBase() {}

    public void populateFromJSONRepresentation(JSONObject json) {
        GWT.log("Populating from representation...", null);

        Iterator i;
        
        for (i = json.keySet().iterator(); i.hasNext();) {
            String key = (String) i.next();
            
            if ("quoted_on".equals(key)) {
                GWT.log("Parsing \"quoted_on\":" + json.get(key), null);
               JSONString js = json.get(key).isString();
               if (js != null) {
                   //this.quotedOn = dateTimeFormat.parse(js.stringValue());
               }
            } else if ("job_id".equals(key)) {
                GWT.log("Parsing \"job_id\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.jobId = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.jobId = 0;
                }
            } else if ("finish_fold_size".equals(key)) {
                GWT.log("Parsing \"finish_fold_size\":" + json.get(key), null);
                JSONString js = json.get(key).isString();
                if (js != null) {
                    this.finishFoldSize = js.stringValue();
                } else {
                    this.finishFoldSize = "";
                }
            } else if ("turnaround".equals(key)) {
                GWT.log("Parsing \"turnaround\":" + json.get(key), null);
                JSONString js = json.get(key).isString();
                if (js != null) {
                    this.turnaround = js.stringValue();
                } else {
                    this.turnaround = "";
                }
            } else if ("finish_flat_size".equals(key)) {
                GWT.log("Parsing \"finish_flat_size\":" + json.get(key), null);
                JSONString js = json.get(key).isString();
                if (js != null) {
                    this.finishFlatSize = js.stringValue();
                } else {
                    this.finishFlatSize = "";
                }
            } else if ("number_of_parts".equals(key)) {
                GWT.log("Parsing \"number_of_parts\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.numberOfParts = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.numberOfParts = 0;
                }
            } else if ("consecutive_start".equals(key)) {
                GWT.log("Parsing \"consecutive_start\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.consecutiveStart = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.consecutiveStart = 0;
                }
            } else if ("quantity_ordered".equals(key)) {
                GWT.log("Parsing \"quantity_ordered\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.quantityOrdered = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.quantityOrdered = 0;
                }
            } else if ("updated_at".equals(key)) {
                GWT.log("Parsing \"updated_at\":" + json.get(key), null);
               JSONString js = json.get(key).isString();
               if (js != null) {
                   //this.updatedAt = dateTimeFormat.parse(js.stringValue());
               }
            } else if ("ordered_on".equals(key)) {
                GWT.log("Parsing \"ordered_on\":" + json.get(key), null);
               JSONString js = json.get(key).isString();
               if (js != null) {
                   //this.orderedOn = dateTimeFormat.parse(js.stringValue());
               }
            } else if ("final_quantity".equals(key)) {
                GWT.log("Parsing \"final_quantity\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.finalQuantity = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.finalQuantity = 0;
                }
            } else if ("due_by".equals(key)) {
                GWT.log("Parsing \"due_by\":" + json.get(key), null);
               JSONString js = json.get(key).isString();
               if (js != null) {
                   //this.dueBy = dateTimeFormat.parse(js.stringValue());
               }
            } else if ("quanitity_overs".equals(key)) {
                GWT.log("Parsing \"quanitity_overs\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.quanitityOvers = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.quanitityOvers = 0;
                }
            } else if ("entry_id".equals(key)) {
                GWT.log("Parsing \"entry_id\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.entryId = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.entryId = 0;
                }
            } else if ("quote_number".equals(key)) {
                GWT.log("Parsing \"quote_number\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.quoteNumber = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.quoteNumber = 0;
                }
            } else if ("overs_on_shelf".equals(key)) {
                GWT.log("Parsing \"overs_on_shelf\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.oversOnShelf = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.oversOnShelf = 0;
                }
            } else if ("cost_set_id".equals(key)) {
                GWT.log("Parsing \"cost_set_id\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.costSetId = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.costSetId = 0;
                }
            } else if ("id".equals(key)) {
                GWT.log("Parsing \"id\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.id = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.id = 0;
                }
            } else if ("proof".equals(key)) {
                GWT.log("Parsing \"proof\":" + json.get(key), null);
                JSONString js = json.get(key).isString();
                if (js != null) {
                    this.proof = js.stringValue();
                } else {
                    this.proof = "";
                }
            } else if ("form_number".equals(key)) {
                GWT.log("Parsing \"form_number\":" + json.get(key), null);
                JSONString js = json.get(key).isString();
                if (js != null) {
                    this.formNumber = js.stringValue();
                } else {
                    this.formNumber = "";
                }
            } else if ("type".equals(key)) {
                GWT.log("Parsing \"type\":" + json.get(key), null);
                JSONString js = json.get(key).isString();
                if (js != null) {
                    this.type = js.stringValue();
                } else {
                    this.type = "";
                }
            } else if ("created_at".equals(key)) {
                GWT.log("Parsing \"created_at\":" + json.get(key), null);
               JSONString js = json.get(key).isString();
               if (js != null) {
                   //this.createdAt = dateTimeFormat.parse(js.stringValue());
               }
            } else if ("billing_on_hold".equals(key)) {
                GWT.log("Parsing \"billing_on_hold\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    int boolNumber = new Double(json.get(key).isNumber().doubleValue()).intValue();
                    if(boolNumber == 1)
                        this.billingOnHold = true;
                    else {
                        this.billingOnHold = false;
                    }
                } else {
                    this.billingOnHold = false;
                }
            } else if ("contact_id".equals(key)) {
                GWT.log("Parsing \"contact_id\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.contactId = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.contactId = 0;
                }
            } else if ("estimator_id".equals(key)) {
                GWT.log("Parsing \"estimator_id\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.estimatorId = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.estimatorId = 0;
                }
            } else if ("consecutive_end".equals(key)) {
                GWT.log("Parsing \"consecutive_end\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.consecutiveEnd = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.consecutiveEnd = 0;
                }
            } else if ("description".equals(key)) {
                GWT.log("Parsing \"description\":" + json.get(key), null);
                JSONString js = json.get(key).isString();
                if (js != null) {
                    this.description = js.stringValue();
                } else {
                    this.description = "";
                }
            } else if ("biller_id".equals(key)) {
                GWT.log("Parsing \"biller_id\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.billerId = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.billerId = 0;
                }
            } else if ("status".equals(key)) {
                GWT.log("Parsing \"status\":" + json.get(key), null);
                JSONString js = json.get(key).isString();
                if (js != null) {
                    this.status = js.stringValue();
                } else {
                    this.status = "";
                }
            } else if ("po".equals(key)) {
                GWT.log("Parsing \"po\":" + json.get(key), null);
                JSONString js = json.get(key).isString();
                if (js != null) {
                    this.po = js.stringValue();
                } else {
                    this.po = "";
                }
            } else if ("csr_id".equals(key)) {
                GWT.log("Parsing \"csr_id\":" + json.get(key), null);
                JSONNumber js = json.get(key).isNumber();
                if (js != null) {
                    this.csrId = new Double(json.get(key).isNumber().doubleValue()).intValue();
                } else {
                    this.csrId = 0;
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
            "\"quoted_on\": " +
            new JSONString(dateTimeFormat.format(quotedOn)).toString() +
            ", " +
            "\"job_id\": " +
            jobId +
            ", " +
            "\"finish_fold_size\": " +
            new JSONString(finishFoldSize).toString() +
            ", " +
            "\"turnaround\": " +
            new JSONString(turnaround).toString() +
            ", " +
            "\"finish_flat_size\": " +
            new JSONString(finishFlatSize).toString() +
            ", " +
            "\"number_of_parts\": " +
            numberOfParts +
            ", " +
            "\"consecutive_start\": " +
            consecutiveStart +
            ", " +
            "\"quantity_ordered\": " +
            quantityOrdered +
            ", " +
            "\"updated_at\": " +
            new JSONString(dateTimeFormat.format(updatedAt)).toString() +
            ", " +
            "\"ordered_on\": " +
            new JSONString(dateTimeFormat.format(orderedOn)).toString() +
            ", " +
            "\"final_quantity\": " +
            finalQuantity +
            ", " +
            "\"due_by\": " +
            new JSONString(dateTimeFormat.format(dueBy)).toString() +
            ", " +
            "\"quanitity_overs\": " +
            quanitityOvers +
            ", " +
            "\"entry_id\": " +
            entryId +
            ", " +
            "\"quote_number\": " +
            quoteNumber +
            ", " +
            "\"overs_on_shelf\": " +
            oversOnShelf +
            ", " +
            "\"cost_set_id\": " +
            costSetId +
            ", " +
            "\"id\": " +
            id +
            ", " +
            "\"proof\": " +
            new JSONString(proof).toString() +
            ", " +
            "\"form_number\": " +
            new JSONString(formNumber).toString() +
            ", " +
            "\"type\": " +
            new JSONString(type).toString() +
            ", " +
            "\"created_at\": " +
            new JSONString(dateTimeFormat.format(createdAt)).toString() +
            ", " +
            "\"billing_on_hold\": " +
            (billingOnHold ? "true" : "false") +
            ", " +
            "\"contact_id\": " +
            contactId +
            ", " +
            "\"estimator_id\": " +
            estimatorId +
            ", " +
            "\"consecutive_end\": " +
            consecutiveEnd +
            ", " +
            "\"description\": " +
            new JSONString(description).toString() +
            ", " +
            "\"biller_id\": " +
            billerId +
            ", " +
            "\"status\": " +
            new JSONString(status).toString() +
            ", " +
            "\"po\": " +
            new JSONString(po).toString() +
            ", " +
            "\"csr_id\": " +
            csrId +
            "}";
    }
    
    // Accessors

    public Date getQuotedOn() {
        return quotedOn;
    }
    
    public void setQuotedOn(Date quotedOn) {
        Date old = this.quotedOn;
        this.quotedOn = quotedOn;
        changes.firePropertyChange("quotedOn", old, quotedOn);
    }
    
    public int getJobId() {
        return jobId;
    }
    
    public void setJobId(int jobId) {
        int old = this.jobId;
        this.jobId = jobId;
        changes.firePropertyChange("jobId", old, jobId);
    }
    
    public String getFinishFoldSize() {
        return finishFoldSize;
    }
    
    public void setFinishFoldSize(String finishFoldSize) {
        String old = this.finishFoldSize;
        this.finishFoldSize = finishFoldSize;
        changes.firePropertyChange("finishFoldSize", old, finishFoldSize);
    }
    
    public String getTurnaround() {
        return turnaround;
    }
    
    public void setTurnaround(String turnaround) {
        String old = this.turnaround;
        this.turnaround = turnaround;
        changes.firePropertyChange("turnaround", old, turnaround);
    }
    
    public String getFinishFlatSize() {
        return finishFlatSize;
    }
    
    public void setFinishFlatSize(String finishFlatSize) {
        String old = this.finishFlatSize;
        this.finishFlatSize = finishFlatSize;
        changes.firePropertyChange("finishFlatSize", old, finishFlatSize);
    }
    
    public int getNumberOfParts() {
        return numberOfParts;
    }
    
    public void setNumberOfParts(int numberOfParts) {
        int old = this.numberOfParts;
        this.numberOfParts = numberOfParts;
        changes.firePropertyChange("numberOfParts", old, numberOfParts);
    }
    
    public int getConsecutiveStart() {
        return consecutiveStart;
    }
    
    public void setConsecutiveStart(int consecutiveStart) {
        int old = this.consecutiveStart;
        this.consecutiveStart = consecutiveStart;
        changes.firePropertyChange("consecutiveStart", old, consecutiveStart);
    }
    
    public int getQuantityOrdered() {
        return quantityOrdered;
    }
    
    public void setQuantityOrdered(int quantityOrdered) {
        int old = this.quantityOrdered;
        this.quantityOrdered = quantityOrdered;
        changes.firePropertyChange("quantityOrdered", old, quantityOrdered);
    }
    
    public Date getUpdatedAt() {
        return updatedAt;
    }
    
    public void setUpdatedAt(Date updatedAt) {
        Date old = this.updatedAt;
        this.updatedAt = updatedAt;
        changes.firePropertyChange("updatedAt", old, updatedAt);
    }
    
    public Date getOrderedOn() {
        return orderedOn;
    }
    
    public void setOrderedOn(Date orderedOn) {
        Date old = this.orderedOn;
        this.orderedOn = orderedOn;
        changes.firePropertyChange("orderedOn", old, orderedOn);
    }
    
    public int getFinalQuantity() {
        return finalQuantity;
    }
    
    public void setFinalQuantity(int finalQuantity) {
        int old = this.finalQuantity;
        this.finalQuantity = finalQuantity;
        changes.firePropertyChange("finalQuantity", old, finalQuantity);
    }
    
    public Date getDueBy() {
        return dueBy;
    }
    
    public void setDueBy(Date dueBy) {
        Date old = this.dueBy;
        this.dueBy = dueBy;
        changes.firePropertyChange("dueBy", old, dueBy);
    }
    
    public int getQuanitityOvers() {
        return quanitityOvers;
    }
    
    public void setQuanitityOvers(int quanitityOvers) {
        int old = this.quanitityOvers;
        this.quanitityOvers = quanitityOvers;
        changes.firePropertyChange("quanitityOvers", old, quanitityOvers);
    }
    
    public int getEntryId() {
        return entryId;
    }
    
    public void setEntryId(int entryId) {
        int old = this.entryId;
        this.entryId = entryId;
        changes.firePropertyChange("entryId", old, entryId);
    }
    
    public int getQuoteNumber() {
        return quoteNumber;
    }
    
    public void setQuoteNumber(int quoteNumber) {
        int old = this.quoteNumber;
        this.quoteNumber = quoteNumber;
        changes.firePropertyChange("quoteNumber", old, quoteNumber);
    }
    
    public int getOversOnShelf() {
        return oversOnShelf;
    }
    
    public void setOversOnShelf(int oversOnShelf) {
        int old = this.oversOnShelf;
        this.oversOnShelf = oversOnShelf;
        changes.firePropertyChange("oversOnShelf", old, oversOnShelf);
    }
    
    public int getCostSetId() {
        return costSetId;
    }
    
    public void setCostSetId(int costSetId) {
        int old = this.costSetId;
        this.costSetId = costSetId;
        changes.firePropertyChange("costSetId", old, costSetId);
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        int old = this.id;
        this.id = id;
        changes.firePropertyChange("id", old, id);
    }
    
    public String getProof() {
        return proof;
    }
    
    public void setProof(String proof) {
        String old = this.proof;
        this.proof = proof;
        changes.firePropertyChange("proof", old, proof);
    }
    
    public String getFormNumber() {
        return formNumber;
    }
    
    public void setFormNumber(String formNumber) {
        String old = this.formNumber;
        this.formNumber = formNumber;
        changes.firePropertyChange("formNumber", old, formNumber);
    }
    
    public String getType() {
        return type;
    }
    
    public void setType(String type) {
        String old = this.type;
        this.type = type;
        changes.firePropertyChange("type", old, type);
    }
    
    public Date getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(Date createdAt) {
        Date old = this.createdAt;
        this.createdAt = createdAt;
        changes.firePropertyChange("createdAt", old, createdAt);
    }
    
    public boolean isBillingOnHold() {
        return billingOnHold;
    }
    
    public void setBillingOnHold(boolean billingOnHold) {
        boolean old = this.billingOnHold;
        this.billingOnHold = billingOnHold;
        changes.firePropertyChange("billingOnHold", old, billingOnHold);
    }
    
    public int getContactId() {
        return contactId;
    }
    
    public void setContactId(int contactId) {
        int old = this.contactId;
        this.contactId = contactId;
        changes.firePropertyChange("contactId", old, contactId);
    }
    
    public int getEstimatorId() {
        return estimatorId;
    }
    
    public void setEstimatorId(int estimatorId) {
        int old = this.estimatorId;
        this.estimatorId = estimatorId;
        changes.firePropertyChange("estimatorId", old, estimatorId);
    }
    
    public int getConsecutiveEnd() {
        return consecutiveEnd;
    }
    
    public void setConsecutiveEnd(int consecutiveEnd) {
        int old = this.consecutiveEnd;
        this.consecutiveEnd = consecutiveEnd;
        changes.firePropertyChange("consecutiveEnd", old, consecutiveEnd);
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        String old = this.description;
        this.description = description;
        changes.firePropertyChange("description", old, description);
    }
    
    public int getBillerId() {
        return billerId;
    }
    
    public void setBillerId(int billerId) {
        int old = this.billerId;
        this.billerId = billerId;
        changes.firePropertyChange("billerId", old, billerId);
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        String old = this.status;
        this.status = status;
        changes.firePropertyChange("status", old, status);
    }
    
    public String getPo() {
        return po;
    }
    
    public void setPo(String po) {
        String old = this.po;
        this.po = po;
        changes.firePropertyChange("po", old, po);
    }
    
    public int getCsrId() {
        return csrId;
    }
    
    public void setCsrId(int csrId) {
        int old = this.csrId;
        this.csrId = csrId;
        changes.firePropertyChange("csrId", old, csrId);
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
