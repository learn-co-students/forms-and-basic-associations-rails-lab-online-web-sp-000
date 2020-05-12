
[1mFrom:[0m /home/parallels/code/labs/forms-and-basic-associations-rails-lab-online-web-sp-000/app/controllers/songs_controller.rb:19 SongsController#create:

    [1;34m14[0m: [32mdef[0m [1;34mcreate[0m
    [1;34m15[0m:   [1;34m# binding.pry[0m
    [1;34m16[0m:   [32mif[0m params[[33m:artist_name[0m] != [31m[1;31m'[0m[31m[1;31m'[0m[31m[0m
    [1;34m17[0m:     artist = [1;34;4mArtist[0m.find_or_create_by([35mname[0m: params[[33m:song[0m][[33m:artist_name[0m])
    [1;34m18[0m:     artist.save
 => [1;34m19[0m:     binding.pry
    [1;34m20[0m:   [32mend[0m
    [1;34m21[0m:   @song = [1;34;4mSong[0m.new(song_params)
    [1;34m22[0m: 
    [1;34m23[0m:   [32mif[0m @song.save
    [1;34m24[0m:     redirect_to @song
    [1;34m25[0m:   [32melse[0m
    [1;34m26[0m:     render [33m:new[0m
    [1;34m27[0m:   [32mend[0m
    [1;34m28[0m: [32mend[0m

