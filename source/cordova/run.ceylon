import ceylon.json { parseJson = parse, JsonArray = Array }

shared void run() {
    dynamic {
        // The HTML element where we'll add our items
        dynamic target = jQuery("#target");
        // The function called when we get data from the server
        void success(dynamic data){
            // Parse the JSON
            assert(is JsonArray titles = parseJson(data));
            target.empty();
            // Iterate titles
            for(title in titles){
              assert(is String title);
              // Now add the HTML items
              dynamic item = jQuery("<li/>").text(title);
              target.append(item);
            }
        }
        dynamic t = jQuery("#text");
        jQuery("#button").click(void (){
           // Query microservice
           jQuery.get("http://localhost:8084/titles/"+t.val(), null, success, "text");
        });
    }
}
