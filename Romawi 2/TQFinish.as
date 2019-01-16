class TQFinish
{
    var timelimited, time, showtime, actionpass, actionfail, actionpassswf, actionpassurl, actionpassexe, actionfailswf, actionfailurl, actionfailexe;
    function TQFinish()
    {
        timelimited = false;
        time = 600000;
        showtime = false;
        actionpass = "3";
        actionfail = "3";
    } // End of the function
    function LoadFromXML(ANode)
    {
        var _loc3 = 0;
        var _loc5;
        while (ANode.childNodes[_loc3])
        {
            switch (ANode.childNodes[_loc3].nodeName)
            {
                case "score":
                {
                    _global.passedscore = ANode.childNodes[_loc3].attributes.value;
                    break;
                } 
                case "time":
                {
                    ANode.childNodes[_loc3].attributes.nrquestions;
                    if (ANode.childNodes[_loc3].attributes.limited == "1")
                    {
                        timelimited = true;
                    }
                    else
                    {
                        timelimited = false;
                    } // end else if
                    time = 0;
                    _loc5 = Number(ANode.childNodes[_loc3].attributes.ss);
                    time = time + _loc5 * 1000;
                    _loc5 = Number(ANode.childNodes[_loc3].attributes.mm);
                    time = time + _loc5 * 60 * 1000;
                    _loc5 = Number(ANode.childNodes[_loc3].attributes.hh);
                    time = time + _loc5 * 3600 * 1000;
                    if (ANode.childNodes[_loc3].attributes.show == "1")
                    {
                        showtime = true;
                    }
                    else
                    {
                        showtime = false;
                    } // end else if
                    break;
                } 
                case "actionpass":
                {
                    actionpass = ANode.childNodes[_loc3].firstChild;
                    actionpassswf = ANode.childNodes[_loc3].attributes.swf;
                    actionpassurl = ANode.childNodes[_loc3].attributes.url;
                    actionpassexe = ANode.childNodes[_loc3].attributes.exe;
                    break;
                } 
                case "actionfail":
                {
                    actionfail = ANode.childNodes[_loc3].firstChild;
                    actionfailswf = ANode.childNodes[_loc3].attributes.swf;
                    actionfailurl = ANode.childNodes[_loc3].attributes.url;
                    actionfailexe = ANode.childNodes[_loc3].attributes.exe;
                    break;
                } 
            } // End of switch
            ++_loc3;
        } // end while
    } // End of the function
} // End of Class
