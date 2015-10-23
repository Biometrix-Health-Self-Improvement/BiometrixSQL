package com.rocket.team.testdatabaseconnection2;

import android.annotation.TargetApi;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.StrictMode;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.EditText;
import android.widget.TextView;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
                new DatabaseConnector().execute();
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    class DatabaseConnector extends AsyncTask<Void, Void, ResultSet>
    {

        @Override
        protected ResultSet doInBackground(Void... params)
        {
            try {
                // SET CONNECTIONSTRING
                Class.forName("net.sourceforge.jtds.jdbc.Driver").newInstance();
                String username = "ReadOnlyTest";
                String password = "ReadTest";
                Connection DbConn = DriverManager.getConnection("jdbc:jtds:sqlserver://rocketjpserver.cktljt0phf7d.us-west-2.rds.amazonaws.com:1433/Test;user=" + username + ";password=" + password + ";instance=SQLEXPRESS");

                Log.w("Connection", "open");
                Statement stmt = DbConn.createStatement();
                ResultSet reset = stmt.executeQuery(" select * from Test.dbo.TeamRocketsTargets");


                //TextView num = (TextView)findViewById(R.id.MainView);
                //num.setText(reset.getString(1));

                DbConn.close();

                return reset;
            } catch (Exception e)
            {
                Log.w("Error connection","" + e.getMessage());
                return null;
            }
        }
    }

    /*
    class DatabaseConnector extends AsyncTask<Void, Void, ResultSet>
    {
        protected ResultSet doInBackground(Void... urls) {
            try {
                // SET CONNECTIONSTRING
                Class.forName("net.sourceforge.jtds.jdbc.Driver").newInstance();
                String username = "ReadOnlyTest";
                String password = "ReadTest";
                Connection DbConn = DriverManager.getConnection("jdbc:jtds:sqlserver://rocketjpserver.cktljt0phf7d.us-west-2.rds.amazonaws.com:1433/DATABASE;user=" + username + ";password=" + password + ";instance=SQLEXPRESS");

                Log.w("Connection", "open");
                Statement stmt = DbConn.createStatement();
                ResultSet reset = stmt.executeQuery(" select * from Test.dbo.TeamRocketsTargets");


                //TextView num = (TextView)findViewById(R.id.MainView);
                //num.setText(reset.getString(1));

                DbConn.close();

                return reset;
            } catch (Exception e)
            {
                Log.w("Error connection","" + e.getMessage());
                return null;
            }
        }
    }
     */
}
