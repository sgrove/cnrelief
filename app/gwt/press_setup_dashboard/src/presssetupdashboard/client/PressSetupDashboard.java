package presssetupdashboard.client;

import com.google.gwt.core.client.GWT;
import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.RootPanel;
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
	private VerticalPanel mainPanel = new VerticalPanel();
	
    /**
     * This is the entry point method.
     */
    public void onModuleLoad() {
        final Button button = new Button("Click me");
        final Label label = new Label();
        
        mainPanel.add(button);
        mainPanel.add(label);
        
        button.addClickHandler(new ClickHandler() {
            public void onClick(ClickEvent event) {
                if (label.getText().equals(""))
                    label.setText("Hello World!");
                else
                    label.setText("");
            }
        });

        // Assume that the host HTML has elements defined whose
        // IDs are "slot1", "slot2".  In a real app, you probably would not want
        // to hard-code IDs.  Instead, you could, for example, search for all 
        // elements with a particular CSS class and replace them with widgets.
        //
        RootPanel.get("dashboardRoot").add(mainPanel);
    }
}
