if status is-interactive
    # Commands to run in interactive sessions can go here
end

function spotifycli
    if test (count $argv) -eq 0
        echo "Usage: spotifycli [options]"
        echo "  -h, --help        show this help message and exit"
        echo "  --version         shows version number"
        echo "  --status          shows song name and artist"
        echo "  --statusshort     shows status in a short way"
        echo "  --song            shows the song name"
        echo "  --songshort       shows the song name in a short way"
        echo "  --artist          shows artists name"
        echo "  --artistshort     shows artist name in a short way"
        echo "  --album           shows album name"
        echo "  --arturl          shows album image url"
        echo "  --lyrics          shows lyrics for the song playing"
        echo "  --playbackstatus  shows playback status"
        echo "  --play            plays the song"
        echo "  --pause           pauses the song"
        echo "  --playpause       plays or pauses the song (toggles a state)"
        echo "  --next            plays the next song"
        echo "  --prev            plays the previous song"
        echo "  --client CLIENT   sets client's dbus name"
        return 1
    end
    python -m spotifycli $argv
end

function transfer
    if test (count $argv) -eq 0
        echo "No arguments specified. Usage: transfer /tmp/test.md"
        return 1
    end

    ## get temporarily filename, output is written to this file show progress can be showed
    set tmpfile ( mktemp -t transferXXX )

    ## upload stdin or file
    set file $argv[1]

    #if tty -s;
    #then
        set basefile (basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g')

    #    if [ ! -e $file ];
    #    then
    #        echo "File $file doesn't exists."
    #        return 1
    #    fi

        if test -d $file
            # zip directory and transfer
            set zipfile ( mktemp -t transferXXX.zip )
            # echo (dirname $file)
            #cd (dirname $file) and echo (pwd)
            zip -r -q - $file >> $zipfile
            curl --progress-bar --upload-file "$zipfile" "https://transfer.sh/$basefile.zip" >> $tmpfile
            rm -f $zipfile
        else
            # transfer file
            curl --progress-bar --upload-file "$file" "https://transfer.sh/$basefile" >> $tmpfile
        end
    #else
    #    # transfer pipe
    #    curl --progress-bar --upload-file "-" "https://transfer.sh/$file" >> $tmpfile
    #fi

    ## cat output link
    cat $tmpfile

    ## cleanup
    rm -f $tmpfile
end

