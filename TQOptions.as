class TQOptions
{
    var all, nrquestions, randomize, submitone, allowfinish, take;
    function TQOptions()
    {
        all = true;
        nrquestions = 1;
        randomize = false;
        submitone = true;
        allowfinish = false;
        take = true;
    } // End of the function
    function LoadFromXML(ANode)
    {
        for (var _loc2 = 0; ANode.childNodes[_loc2]; ++_loc2)
        {
            switch (ANode.childNodes[_loc2].nodeName)
            {
                case "all":
                {
                    if (String(ANode.childNodes[_loc2].childNodes[0]) == "0")
                    {
                        all = false;
                    }
                    else
                    {
                        all = true;
                    } // end else if
                    nrquestions = ANode.childNodes[_loc2].attributes.nrquestions;
                    if (nrquestions == undefined)
                    {
                        nrquestions = 1;
                    } // end if
                    if (ANode.childNodes[_loc2].attributes.randomize == "1")
                    {
                        randomize = true;
                    }
                    else
                    {
                        randomize = false;
                    } // end else if
                    break;
                } 
                case "submitone":
                {
                    if (String(ANode.childNodes[_loc2].childNodes[0]) == "0")
                    {
                        submitone = false;
                    }
                    else
                    {
                        submitone = true;
                    } // end else if
                    if (ANode.childNodes[_loc2].attributes.finish == "1")
                    {
                        allowfinish = true;
                    }
                    else
                    {
                        allowfinish = false;
                    } // end else if
                    if (ANode.childNodes[_loc2].attributes.take == "1")
                    {
                        take = true;
                    }
                    else
                    {
                        take = false;
                    } // end else if
                    break;
                } 
            } // End of switch
        } // end of for
    } // End of the function
} // End of Class
