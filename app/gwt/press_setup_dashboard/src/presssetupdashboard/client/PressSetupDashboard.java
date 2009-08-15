package presssetupdashboard.client;

import java.util.ArrayList;

import press.client.resource.PressBase;
import press.client.resource.Press;

import com.google.gwt.core.client.GWT;
import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.event.dom.client.ChangeEvent;
import com.google.gwt.event.dom.client.ChangeHandler;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.http.client.Request;
import com.google.gwt.http.client.RequestBuilder;
import com.google.gwt.http.client.RequestCallback;
import com.google.gwt.http.client.RequestException;
import com.google.gwt.http.client.Response;
import com.google.gwt.http.client.URL;
import com.google.gwt.json.client.*;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.DecoratedPopupPanel;
import com.google.gwt.user.client.ui.FlexTable;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.DockPanel;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.RootPanel;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.VerticalPanel;
import com.google.gwt.user.client.ui.Widget;

import com.kaboomerang.gwt.rest.client.resource.*;
import com.kaboomerang.gwt.rest.client.resource.impl.*;
import com.kaboomerang.gwt.rest.client.handler.*;
import com.kaboomerang.gwt.rest.client.callback.*;
import com.kaboomerang.gwt.rest.client.uri.*;

/**
 * Entry point classes define <code>onModuleLoad()</code>.
 */
public class PressSetupDashboard implements EntryPoint {
	/** 
	 * Internal variables
	 */
	private static final String PRESSES_URL = "http://localhost:3000/presses.js";
	private static final String NEW_PRESS_URL = "http://localhost:3000/presses";
	private static final String PRESS_URL = "http://localhost:3000/presses/";

	private ArrayList presses = new ArrayList();
	private String url;	
	
	/**
	 *  Interface elements for this form
	 */
	
	// Panel + Table Elements
	private HorizontalPanel headerPanel = new HorizontalPanel();
	private HorizontalPanel pressPanel = new HorizontalPanel();
	private VerticalPanel pressDetailsPanel = new VerticalPanel();

	private VerticalPanel mainPanel = new VerticalPanel();
	private HorizontalPanel runRatesPanel = new HorizontalPanel();
	private HorizontalPanel washupTimesPanel = new HorizontalPanel();
	private HorizontalPanel plateTimesPanel = new HorizontalPanel();
	private VerticalPanel washup_and_plate_Panel = new VerticalPanel();
	private HorizontalPanel washup_plates_costs = new HorizontalPanel();
	private VerticalPanel chargesPanel = new VerticalPanel();
	

	private FlexTable costTable = new FlexTable();

	// All form labels
	private final Label formHeaderLabel = new Label("Managing Presses");
	private final Label statusLabel = new Label("Loading Application...");
	private final Label pressNameLabel = new Label("Press Name:");
	private final Label pressSizeLabel = new Label("Press Size:");
	private final Label runRateLabel = new Label("Run Rates:");
	private final Label lightLabel = new Label("Light Ink Coverage:");
	private final Label mediumLabel = new Label("Medium Ink Coverage:");
	private final Label mediumHeavyLabel = new Label("Medium-Heavy Ink Coverage:");
	private final Label heavyLabel = new Label("Heavy Ink Coverage:");
	private final Label washupTimeLabel = new Label("Washup Times:");
	private final Label initialWashupLabel = new Label("Initial:");
	private final Label additionalWashupLabel = new Label("Additional:");
	private final Label plateTimeLabel = new Label("Plate Times:");
	private final Label initialPlateLabel = new Label("Initial:");
	private final Label additionalPlateLabel = new Label("Additional:");
	private final Label chargesLabel = new Label("Hourly Press Charge");
	
	// All inputs to modify a given press
	private TextBox pressNameField = new TextBox();
	private TextBox pressSizeField = new TextBox();
	private TextBox lightRunRateField = new TextBox();
	private TextBox mediumRunRateField = new TextBox();
	private TextBox mediumHeavyRunRateField = new TextBox();
	private TextBox heavyRunRateField = new TextBox();
	private TextBox initialWashupField = new TextBox();
	private TextBox additionalWashupField = new TextBox();
	private TextBox initialPlateField = new TextBox();
	private TextBox additionalPlateField = new TextBox();
	
	// Select press ListBox element
	private final ListBox pressListBox = new ListBox(false);
	
	// Form Button
	private final Button submitButton = new Button("Loading...");
	
	// Debugging helpers
	private final Label debugLabel = new Label();
    //final DecoratedPopupPanel pressDetailsPopup = new DecoratedPopupPanel(true);


	/**
	 * This is the entry point method.
	 */
	public void onModuleLoad() {
		
		formHeaderLabel.setText("Managing Presses");
		
		//should work but pops up errors. stupid alignments
		//i copied this from the gwt docs. but still...
		//runRatesPanel.setVerticalAlignment(HasVerticalAlignment.ALIGN_BOTTOM);
		
		mainPanel.add(headerPanel);
		mainPanel.add(pressPanel);
		mainPanel.add(pressDetailsPanel);
		mainPanel.add(debugLabel);
		
		// Setup headerPanel
		headerPanel.add(formHeaderLabel);
		headerPanel.add(pressListBox);
		
		// Setup pressPanel
		pressPanel.add(pressNameLabel);
		pressPanel.add(pressNameField);
		pressPanel.add(pressSizeLabel);
		pressPanel.add(pressSizeField);
		pressPanel.add(submitButton);
		
		washup_and_plate_Panel.add(washupTimesPanel);
		washup_and_plate_Panel.add(plateTimesPanel);
		
		// Setup pressDetailsPanel
		pressDetailsPanel.add(runRatesPanel);
			
		//pressDetailsPanel.add(washupTimesPanel);
		//pressDetailsPanel.add(plateTimesPanel);
		washup_plates_costs.add(washup_and_plate_Panel);
		washup_plates_costs.add(chargesPanel);
		
		pressDetailsPanel.add(washup_plates_costs);
		
		//pressDetailsPanel.add(chargesPanel);
		
		//set sizes of all numeric fields
		lightRunRateField.setVisibleLength(4);
		mediumRunRateField.setVisibleLength(4);
		mediumHeavyRunRateField.setVisibleLength(4);
		heavyRunRateField.setVisibleLength(4);
		initialWashupField.setVisibleLength(4);
		additionalWashupField.setVisibleLength(4);
		initialPlateField.setVisibleLength(4);
		additionalPlateField.setVisibleLength(4);
		
		// Setup runRatesPanel
		runRatesPanel.add(runRateLabel);
		runRatesPanel.setCellWidth(runRateLabel, "75px");
		runRateLabel.getElement().setId("boldlabel");
		
		runRatesPanel.add(lightLabel);
		runRatesPanel.setCellWidth(lightLabel, "76px");
		runRatesPanel.add(lightRunRateField);
		runRatesPanel.setCellWidth(lightRunRateField, "50px");

		runRatesPanel.add(mediumLabel);
		runRatesPanel.setCellWidth(mediumLabel, "84px");
		runRatesPanel.add(mediumRunRateField);
		runRatesPanel.setCellWidth(mediumRunRateField, "50px");
		
		runRatesPanel.add(mediumHeavyLabel);
		runRatesPanel.setCellWidth(mediumHeavyLabel, "110px");
		runRatesPanel.add(mediumHeavyRunRateField);
		runRatesPanel.setCellWidth(mediumHeavyRunRateField, "50px");

		runRatesPanel.add(heavyLabel);
		runRatesPanel.setCellWidth(heavyLabel, "90px");
		runRatesPanel.add(heavyRunRateField);
		runRatesPanel.setCellWidth(heavyRunRateField, "50px");
		
				
		// Setup washupTimesPanel
		washupTimeLabel.getElement().setId("boldlabel");
		
		washupTimesPanel.add(washupTimeLabel);
		washupTimesPanel.setCellWidth(washupTimeLabel, "11%");
		
		washupTimesPanel.add(initialWashupLabel);
		washupTimesPanel.setCellWidth(initialWashupLabel, "4%");
		
		washupTimesPanel.add(initialWashupField);
		washupTimesPanel.setCellWidth(initialWashupField, "10%");
		
		washupTimesPanel.add(additionalWashupLabel);
		washupTimesPanel.setCellWidth(additionalWashupLabel, "5%");
		
		washupTimesPanel.add(additionalWashupField);
		washupTimesPanel.setCellWidth(additionalWashupField, "5%");
		
		// Setup plateTimesPanel
		
		plateTimeLabel.getElement().setId("boldlabel");
		plateTimesPanel.add(plateTimeLabel);
		plateTimesPanel.setCellWidth(plateTimeLabel, "11%");
		
		plateTimesPanel.add(initialPlateLabel);
		plateTimesPanel.setCellWidth(initialPlateLabel, "4%");
		
		plateTimesPanel.add(initialPlateField);
		plateTimesPanel.setCellWidth(initialPlateField, "10%");
		
		plateTimesPanel.add(additionalPlateLabel);
		plateTimesPanel.setCellWidth(additionalPlateLabel, "5%");
		
		plateTimesPanel.add(additionalPlateField);
		plateTimesPanel.setCellWidth(additionalPlateField, "5%");
			
		// Setup chargesPanel
		chargesLabel.getElement().setId("boldlabel");
		chargesPanel.add(chargesLabel);
		chargesPanel.add(costTable);
		
		// Setup costTable
		costTable.setText(0, 0, "Cost Set");
		costTable.setText(0, 1, "Charge");
		
		//mainPanel.add(pressId);
		//mainPanel.add(pressListBox);
		//mainPanel.add(button);
		//mainPanel.add(statusLabel);
		
		
//		submitButton.addClickHandler(new ClickHandler() {
//			public void onClick(ClickEvent event) {
//				if (statusLabel.getText().equals("")) {
//					retrievePresses();
//				} else {
//					statusLabel.setText("");
//				}
//			}
//		});

		pressListBox.addChangeHandler(new ChangeHandler() {
			public void onChange(ChangeEvent event) {
				GWT.log("Press Selection Changed!", null);
				refreshPressFormInfo();
				//GWT.log("Index " + pressIndex.toString() + " Selected, casting to press...", null);
				GWT.log("Event Details: " + event.toDebugString(), null);
			}
		});
		
		// Enable our submit button
		submitButton.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent e) {
				String value = pressListBox.getValue(pressListBox.getSelectedIndex());
				GWT.log("Value to refresh form to: " + value, null);
				
				
				if (value.equals("new")) {
					GWT.log("Submitting new press", null);
					// Submit a new press, sans ID
					submitPressForm(newPressFromForm());
				} else {
					GWT.log("submitting updated press details", null);
					submitPressForm((Press) presses.get(Integer.parseInt(value)));
				}

			}

		});


		// Assume that the host HTML has elements defined whose
		// IDs are "slot1", "slot2".  In a real app, you probably would not want
		// to hard-code IDs.  Instead, you could, for example, search for all 
		// elements with a particular CSS class and replace them with widgets.
		//
		//RootPanel.get("slot1").add(pressId);
		RootPanel.get("dashboardRoot").add(mainPanel);
		retrievePresses();
	}
	
	private Press newPressFromForm() {
		// Fill out form details
		Press press = new Press();
		press.setName(pressNameField.getText());
		press.setSize(pressSizeField.getText());
		press.setWashupInitialMinutes(Integer.parseInt(initialWashupField.getText()));
		press.setWashupAdditionalMinutes(Integer.parseInt(additionalWashupField.getText()));
		press.setPlateInitialMinutes(Integer.parseInt(initialPlateField.getText()));
		press.setPlateAdditionalMinutes(Integer.parseInt(additionalPlateField.getText()));
		
		return press;
	}
	
	private Press updatePressFromForm(Press press) {
		// Fill out form details
		press.setName(pressNameField.getText());
		press.setSize(pressSizeField.getText());
		press.setWashupInitialMinutes(Integer.parseInt(initialWashupField.getText()));
		press.setWashupAdditionalMinutes(Integer.parseInt(additionalWashupField.getText()));
		press.setPlateInitialMinutes(Integer.parseInt(initialPlateField.getText()));
		press.setPlateAdditionalMinutes(Integer.parseInt(additionalPlateField.getText()));
		
		return press;
	}

	private void displayPressDetails(Press press) {
		GWT.log("Setting press details...", null);
		GWT.log("I should be showing you the press named " + press.getName() + "!", null);
		
		submitButton.setText("Update Press Information");
		
		// Fill out form details
		pressNameField.setText(press.getName());
		pressSizeField.setText(press.getSize());
		initialWashupField.setText("" + press.getWashupInitialMinutes());
		additionalWashupField.setText("" + press.getWashupAdditionalMinutes());
		initialPlateField.setText("" + press.getPlateInitialMinutes());
		additionalPlateField.setText("" + press.getPlateAdditionalMinutes());
		// Field.setText(press.get());
	}

	private void retrievePresses() {
		pressListBox.clear();
		RequestBuilder builder = new RequestBuilder(RequestBuilder.GET, URL.encode(PRESSES_URL));

		GWT.log("Loading presses from " + PRESSES_URL, null);
		GWT.log("Request: " + builder.toString() + ", Method: " + builder.getHTTPMethod() + ", Url: " + builder.getUrl(), null);
		statusLabel.setText("Retrieve Presses...");

		try {
			Request request = builder.sendRequest(null, new RequestCallback() {
				public void onError(Request request, Throwable exception) {
					GWT.log("Server returned an error.", null);
					statusLabel.setText("Error encountered, code 201.");
				}

				public void onResponseReceived(Request request, Response response) {
					if (200 == response.getStatusCode()) {
						parsePresses(response.getText());
						statusLabel.setText("Presses retrieved.");
					} else {
						GWT.log("Couldn't retrieve JSON - Server Problem: (" + response.getStatusText() + "-" + response.getStatusCode() + ") [at URL: " + url, null);
						statusLabel.setText("Error encountered, code 201.");
					}
				}       
			});
		} catch (RequestException e) {
			GWT.log("Couldn't retrieve JSON", null);
			statusLabel.setText("Error Encountered, code 200.");
		}	

	}

	private ArrayList parsePresses(String rawJSON) {
		// Basic sanity check: response should be contained in an array.

		JSONArray jsonPresses = (JSONArray) JSONParser.parse(rawJSON);
		

		GWT.log("Parsed JSON String: " + jsonPresses.toString(), null);

		for(Integer i = 0;i < jsonPresses.size(); i++) {
			GWT.log("Attempting to populate press from json " + jsonPresses.get(i), null);

			Press press = new Press();
			press.populateFromJSONRepresentation((JSONObject) jsonPresses.get(i));
			try {
				if (press != null) {
					
					pressListBox.addItem(press.getName(), i.toString());
					presses.add(press);
				} else {
					throw new JSONException(); 
				}
			} catch (JSONException e) {
				GWT.log("Could not parse JSON (" + rawJSON + ")", null);
				statusLabel.setText("Error encountered, code 210.");
			}
		}
		
		pressListBox.addItem("New Press", "new");

		refreshPressFormInfo();
		
		return presses;
	}
	
	private void submitPressForm(Press press) {
		GWT.log("Entered the submitPressForm method...", null);
		String method = "post";

		press = updatePressFromForm(press);
		String jsonData;
		String url;
		
		if (press.isNewRecord()) {
			url = NEW_PRESS_URL; 
			jsonData = press.toFullRepresentation();
			GWT.log("New record. POSTing " + jsonData, null);
		} else {
			url = PRESS_URL + press.getId();
			method = "put";
			jsonData = press.toFullRepresentation();
			GWT.log("New record. PUTing " + jsonData, null);
		}
		
		RequestBuilder rb = new RequestBuilder(RequestBuilder.POST, URL.encode(url));
		rb.setHeader("Content-Type", "application/json");
		rb.setHeader("X-HTTP-Method-Override", method);

		GWT.log("Posting press to " + PRESSES_URL, null);
		GWT.log("Request: " + rb.toString() + ", Method: " + rb.getHTTPMethod() + ", Url: " + rb.getUrl(), null);
		statusLabel.setText("Submitting Press info...");
		
		

		// Need to change the method "\"_method\":" + method
		try {
			Request request = rb.sendRequest(jsonData, new RequestCallback() {
				public void onError(Request request, Throwable exception) {
					GWT.log("Server returned an error.", null);
					statusLabel.setText("Error encountered, code 205.");
				}

				public void onResponseReceived(Request request, Response response) {
					if (200 == response.getStatusCode()) {
						statusLabel.setText("Press changes processed!");
						retrievePresses();
					} else {
						GWT.log("Couldn't retrieve JSON - Server Problem: (" + response.getStatusText() + "-" + response.getStatusCode() + ")", null);
						statusLabel.setText("Error encountered, code 201.");
					}
				}       
			});
		} catch (RequestException e) {
			GWT.log("Couldn't post JSON. (" + e.toString() + ")" , null);
			statusLabel.setText("Error Encountered, code 200.");
		}	
	}

	private void refreshPressFormInfo() {
		String value = pressListBox.getValue(pressListBox.getSelectedIndex());
		GWT.log("Value to refresh form to: " + value, null);
		
		
		if (value.equals("new")) {
			GWT.log("Setting to new press form", null);
			// Do we do anything here?
			clearPressForm();
		} else {
			GWT.log("Showing press details", null);
			displayPressDetails((Press) presses.get(Integer.parseInt(value)));
		}
	}
	
	private void clearPressForm() {
		GWT.log("Clearing the press form...", null);
		displayPressDetails(new Press());
		submitButton.setText("Create new press");
	}
}
