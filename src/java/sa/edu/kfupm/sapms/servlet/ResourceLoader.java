package sa.edu.kfupm.sapms.servlet;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

public class ResourceLoader {

    private String BASE_URL = "http://localhost/SAPMS/";

    public String getJavaScript(String path) {
        try {
            URL url = new URL(BASE_URL + path);
            HttpClient client = new DefaultHttpClient();
            HttpGet request = new HttpGet(url.toString());
            request.setURI(url.toURI());

            HttpResponse response = client.execute(request);
            BufferedReader in = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            StringBuilder sb = new StringBuilder();
            String line = "";
            while ((line = in.readLine()) != null) {
                sb.append(line);
            }

            return sb.toString();
        } catch (Exception ex) {
            Logger.getLogger(ResourceLoader.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "ERROR";
    }

    public String getPage(String path, List<NameValuePair> params) {
        try {
            String paramString = "";
            for (NameValuePair param : params) {
                paramString += URLEncoder.encode(param.getName(), "UTF-8") + "=" + URLEncoder.encode(param.getValue(), "UTF-8") + "&";
            }
            if (params.size() > 0) {
                paramString = paramString.substring(0, paramString.length() - 1);
            }

            String fullURL = BASE_URL + path + "?" + paramString;
            URL url = new URL(fullURL);

            HttpClient client = new DefaultHttpClient();
            HttpGet request = new HttpGet(fullURL);
            request.setURI(url.toURI());

            HttpResponse response = client.execute(request);
            BufferedReader in = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            StringBuilder sb = new StringBuilder();
            String line = "";
            while ((line = in.readLine()) != null) {
                sb.append(line);
            }

            return sb.toString();
        } catch (Exception ex) {
            Logger.getLogger(ResourceLoader.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "ERROR";
    }

}
