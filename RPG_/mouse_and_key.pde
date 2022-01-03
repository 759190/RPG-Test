
 

void keyPressed () {
if (keyCode=='W') wkey=true;
if (keyCode=='S') skey=true;
if (keyCode=='D') dkey=true;
if (keyCode=='A') akey=true;
if (keyCode=='1') onekey=true;
if (keyCode=='2') twokey=true;
if (keyCode=='3') threekey=true;
if (keyCode==' ') spacekey=true;
if (keyCode=='P') pkey=true;

}

void keyReleased() {
if (keyCode=='W') wkey=false;
if (keyCode=='S') skey=false;
if (keyCode=='D') dkey=false;
if (keyCode=='A') akey=false;
if (keyCode=='1') onekey=false;
if (keyCode=='2') twokey=false;
if (keyCode=='3') threekey=false;
if (keyCode==' ') spacekey=false;
if (keyCode=='P') pkey=false;
}
