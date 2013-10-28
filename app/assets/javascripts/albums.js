$(document).ready(function() {
    return $("#add_song").click(function() {
        var cloned, size, source;
        source = $("#song_template >");
        cloned = source.clone();
        size = $("#songs .song_name").size();

        $(".song_id", cloned).attr("id", ["album_songs_attributes_", size, "_id"].join(""));
        $(".song_id", cloned).attr("name", ["album[songs_attributes][", size, "][id]"].join(""));
        $("label", cloned).attr("for", ["album_songs_attributes_", size, "_name"].join(""));
        $(".song_name", cloned).attr("id", ["album_songs_attributes_", size, "_name"].join(""));
        $(".song_name", cloned).attr("name", ["album[songs_attributes][", size, "][name]"].join(""));

        $("#songs").append(cloned);
        return false;
    });
});
