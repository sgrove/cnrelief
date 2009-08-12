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
import com.google.gwt.user.client.ui.HTML;
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
	private static final String PRESS_URL = "http://localhost:3000/presses/";
	private static final String PRESSES_URL = "http://localhost:3000/presses.js";
	private VerticalPanel mainPanel = new VerticalPanel();
	private TextBox pressId = new TextBox(); 
	private String url;
	private final Label header = new Label();
	private final Button button = new Button("Retrieve Presses");
	private final Label statusLabel = new Label();
	private ArrayList presses = new ArrayList();
	
	private final Label pressDetailsLabel = new Label();
    final DecoratedPopupPanel pressDetailsPopup = new DecoratedPopupPanel(true);

	// Add a drop box with the list types
	final ListBox pressListBox = new ListBox(false);

	/**
	 * This is the entry point method.
	 */
	public void onModuleLoad() {


		header.setText("Managing Presses");

		mainPanel.add(header);
		//mainPanel.add(pressId);
		mainPanel.add(pressListBox);
		mainPanel.add(button);
		mainPanel.add(statusLabel);
		
		pressDetailsPopup.add(pressDetailsLabel);
		
		button.addClickHandler(new ClickHandler() {
			public void onClick(ClickEvent event) {
				if (statusLabel.getText().equals("")) {
					retrievePresses();
				} else {
					statusLabel.setText("");
				}
			}
		});
		
		pressListBox.addChangeHandler(new ChangeHandler() {
			public void onChange(ChangeEvent event) {
            // Reposition the popup relative to the button
            Widget source = (Widget) event.getSource();
            int left = source.getAbsoluteLeft() + 10;
            int top = source.getAbsoluteTop() + 10;
            pressDetailsPopup.setPopupPosition(left, top);
            GWT.log("Casting to press...", null);
            Press press = (Press) presses.get(0);
            GWT.log("Outputting details to popup...", null);
            GWT.log("Event Details: " + event.toDebugString(), null);
            pressDetailsLabel.setText(press.toRepresentation());

            // Show the popup
            pressDetailsPopup.show();
          }
		});



		// Assume that the host HTML has elements defined whose
		// IDs are "slot1", "slot2".  In a real app, you probably would not want
		// to hard-code IDs.  Instead, you could, for example, search for all 
		// elements with a particular CSS class and replace them with widgets.
		//
		//RootPanel.get("slot1").add(pressId);
		RootPanel.get("dashboardRoot").add(mainPanel);
	}

	private void displayPressDetails(Press press) {

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

		for(int i = 0;i < jsonPresses.size(); i++) {
			GWT.log("Attempting to populate press from json " + jsonPresses.get(i), null);

			Press press = new Press();
			press.populateFromJSONRepresentation((JSONObject) jsonPresses.get(i));
			try {
				if (press != null) {
					pressListBox.addItem(press.getName());
					pressListBox.addItem(press.getName()); // Just to play around, we do it 2x
					presses.add(press);
				} else {
					throw new JSONException(); 
				}
			} catch (JSONException e) {
				GWT.log("Could not parse JSON (" + rawJSON + ")", null);
				statusLabel.setText("Error encountered, code 210.");
			}
		}

		return presses;
	}
}