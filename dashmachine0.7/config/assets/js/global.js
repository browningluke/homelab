function setupTypewriter(t) {
    var HTML = t.innerHTML;

    t.innerHTML = "";

    var cursorPosition = 0,
        tag = "",
        writingTag = false,
        tagOpen = false,
        typeSpeed = 100,
        tempTypeSpeed = 0;

    var type = function() {
    
        if (writingTag === true) {
            tag += HTML[cursorPosition];
        }

        if (HTML[cursorPosition] === "<") {
            tempTypeSpeed = 0;
            if (tagOpen) {
                tagOpen = false;
                writingTag = true;
            } else {
                tag = "";
                tagOpen = true;
                writingTag = true;
                tag += HTML[cursorPosition];
            }
        }
        if (!writingTag && tagOpen) {
            tag.innerHTML += HTML[cursorPosition];
        }
        if (!writingTag && !tagOpen) {
            if (HTML[cursorPosition] === " ") {
                tempTypeSpeed = 0;
            }
            else {
                tempTypeSpeed = (Math.random() * typeSpeed) + 50;
            }
            t.innerHTML += HTML[cursorPosition];
        }
        if (writingTag === true && HTML[cursorPosition] === ">") {
            tempTypeSpeed = (Math.random() * typeSpeed) + 50;
            writingTag = false;
            if (tagOpen) {
                var newSpan = document.createElement("span");
                t.appendChild(newSpan);
                newSpan.innerHTML = tag;
                tag = newSpan.firstChild;
            }
        }

        cursorPosition += 1;
        if (cursorPosition < HTML.length) {
            setTimeout(type, tempTypeSpeed);
        }

    };

    return {
        type: type
    };
}

function getTimeNow(word=false) {
    function addZero(i) {
      if (i < 10) {
        i = "0" + i;
      }
      return i;
    }
    var d = new Date();
    var hours = d.getHours();
    var h = addZero(hours) % 12;
    var m = addZero(d.getMinutes());
    var SUFFIX = ""
    if (Math.floor(hours/12) == 1) {
        SUFFIX = "PM"
    } else {
        SUFFIX = "AM"
    }
    
    if (h == 0) { h = 12 }

    if (!word){
        return h + ":" + m + SUFFIX;
    } else {
        if (SUFFIX == "AM" && h >= 1) { return "morning" }
        if (SUFFIX == "PM" && h < 5) { return "afternoon" }
        if (SUFFIX == "PM" && h >= 5) { return "evening" }
    }
  } 

setTimeout(function() {
    try {
        var typer = document.getElementById('typewriter');
        var typer1 = document.getElementById('typewriter1');
        var typer2 = document.getElementById('typewriter2');
    
        typer1.innerText = getTimeNow();
        typer2.innerText = getTimeNow(word=true);
        
        typewriter = setupTypewriter(typewriter);
        typewriter.type();  
    } catch (error) {
        return;
    }

}, 500 );

setTimeout(function() {
    //console.log(document.getElementById("typewriter1"))
    setInterval(function() { 
        if (document.getElementById('typewriter2').innerText == "") {
            var typer1 = document.getElementById('typewriter1');
            var typer2 = document.getElementById('typewriter2');
        
            typer1.innerText = getTimeNow();
            typer2.innerText = getTimeNow(word=true);

            setupTypewriter(typer1).type();
            setupTypewriter(typer2).type();
        } else {        
            var typer1 = document.getElementById("typewriter1");
            if (typer1.innerText != getTimeNow()) {
                typer1.innerText = getTimeNow();
                typewriter1 = setupTypewriter(typer1);
                typewriter1.type()
            }
        }
    }, 1000)
}, 5000)