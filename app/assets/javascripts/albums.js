$(document).ready(function() {
    return $("#add_song").click(function() {
        var cloned, index, source;
        source = $("#song_template >");
        cloned = source.clone();
        index = $("#songs .song_name").size().toString();

        $("label", cloned).attr("for", function(i, value) {
          replaced = value.replace("album", "album_songs_attributes");
          replaced = replaced.replace("empty_song", index);
          return replaced;
        });

        $("input", cloned).attr("id", function(i, value) {
          replaced = value.replace("album", "album_songs_attributes");
          replaced = replaced.replace("empty_song", index);
          replaced = replaced.replace("user", "user_attributes");
          return replaced;
        });

        $("input", cloned).attr("name", function(i, value) {
          replaced = value.replace("album", "album[songs_attributes]");
          replaced = replaced.replace("empty_song", index);
          replaced = replaced.replace("user", "user_attributes");
          return replaced;
        });

        $("#songs").append(cloned);
        return false;
    });
});
