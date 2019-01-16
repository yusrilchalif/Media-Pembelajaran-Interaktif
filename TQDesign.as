class TQDesign
{
    var tfont, lfont, qfont, afont, qbfont, sfont, mfont, ifont, toctfont, tocfont, ffont, takecfont, takefont, timerfont, bfont, backcolor, qback, qbback, qbback2, tocback, dtoc, dtocpoints, dtocciicons, dpoints, dcscore, dnumbering, daudio, dinfo, infoemail, infoweb, numberingstyle, passfailmessages, review, email, print, printusername, passmessage, failmessage, emailaddress, rollover, rollovercolor, rbstyle, cbstyle;
    function TQDesign()
    {
        tfont = new TQFont();
        lfont = new TQFont();
        qfont = new TQFont();
        afont = new TQFont();
        qbfont = new TQFont();
        sfont = new TQFont();
        mfont = new TQFont();
        ifont = new TQFont();
        toctfont = new TQFont();
        tocfont = new TQFont();
        ffont = new TQFont();
        takecfont = new TQFont();
        takefont = new TQFont();
        timerfont = new TQFont();
        bfont = new TQFont();
        backcolor = 16777215;
        qback = new TQBackground();
        qbback = new TQBackground();
        qbback2 = new TQBackground();
        tocback = new TQBackground();
        dtoc = true;
        dtocpoints = true;
        dtocciicons = true;
        dpoints = true;
        dcscore = true;
        dnumbering = true;
        daudio = true;
        dinfo = true;
        infoemail = "support@quiz-builder.com";
        infoweb = "http://www.quiz-builder.com";
        numberingstyle = "0";
        passfailmessages = true;
        review = true;
        email = true;
        print = true;
        printusername = true;
        passmessage = "";
        failmessage = "";
        emailaddress = "";
        rollover = true;
        rollovercolor = 16777215;
    } // End of the function
    function RemoveCR(astring)
    {
        var _loc2;
        var _loc5;
        var _loc3;
        var _loc6;
        var _loc1;
        var _loc4;
        _loc2 = new String(astring);
        _loc5 = String.fromCharCode(13) + String.fromCharCode(10);
        _loc6 = _loc2.indexOf(_loc5);
        if (_loc6 != -1)
        {
            _loc3 = new String();
            for (var _loc1 = 0; _loc1 < _loc2.length; ++_loc1)
            {
                _loc4 = _loc2.charCodeAt(_loc1);
                if (_loc4 != 13)
                {
                    _loc3 = _loc3 + _loc2.charAt(_loc1);
                } // end if
            } // end of for
            return (String(_loc3));
        }
        else
        {
            return (String(_loc2));
        } // end else if
    } // End of the function
    function LoadFromXML(ANode)
    {
        for (var _loc2 = 0; ANode.childNodes[_loc2]; ++_loc2)
        {
            switch (ANode.childNodes[_loc2].nodeName)
            {
                case "tfont":
                {
                    tfont.LoadFromXML(ANode.childNodes[_loc2]);
                    break;
                } 
                case "lfont":
                {
                    lfont.LoadFromXML(ANode.childNodes[_loc2]);
                    break;
                } 
                case "qfont":
                {
                    qfont.LoadFromXML(ANode.childNodes[_loc2]);
                    break;
                } 
                case "afont":
                {
                    afont.LoadFromXML(ANode.childNodes[_loc2]);
                    break;
                } 
                case "qbfont":
                {
                    qbfont.LoadFromXML(ANode.childNodes[_loc2]);
                    break;
                } 
                case "sfont":
                {
                    sfont.LoadFromXML(ANode.childNodes[_loc2]);
                    break;
                } 
                case "mfont":
                {
                    mfont.LoadFromXML(ANode.childNodes[_loc2]);
                    break;
                } 
                case "ifont":
                {
                    ifont.LoadFromXML(ANode.childNodes[_loc2]);
                    break;
                } 
                case "toctfont":
                {
                    toctfont.LoadFromXML(ANode.childNodes[_loc2]);
                    break;
                } 
                case "tocfont":
                {
                    tocfont.LoadFromXML(ANode.childNodes[_loc2]);
                    break;
                } 
                case "ffont":
                {
                    ffont.LoadFromXML(ANode.childNodes[_loc2]);
                    break;
                } 
                case "takefont":
                {
                    takefont.LoadFromXML(ANode.childNodes[_loc2]);
                    break;
                } 
                case "takecfont":
                {
                    takecfont.LoadFromXML(ANode.childNodes[_loc2]);
                    break;
                } 
                case "timerfont":
                {
                    timerfont.LoadFromXML(ANode.childNodes[_loc2]);
                    break;
                } 
                case "bfont":
                {
                    bfont.LoadFromXML(ANode.childNodes[_loc2]);
                    break;
                } 
                case "qback":
                {
                    qback.LoadFromXML(ANode.childNodes[_loc2]);
                    break;
                } 
                case "qbback":
                {
                    qbback.LoadFromXML(ANode.childNodes[_loc2]);
                    qbback2.enable = qbback.enable;
                    qbback2.border = qbback.border;
                    qbback2.fill = qbback.fill;
                    qbback2.round = qbback.round;
                    qbback2.shadow = qbback.shadow;
                    break;
                } 
                case "tocback":
                {
                    tocback.LoadFromXML(ANode.childNodes[_loc2]);
                    break;
                } 
                case "rollover":
                {
                    if (String(ANode.childNodes[_loc2].childNodes[0]) == "1")
                    {
                        rollover = true;
                    }
                    else
                    {
                        rollover = false;
                    } // end else if
                    rollovercolor = Number(ANode.childNodes[_loc2].attributes.color);
                    break;
                } 
                case "backcolor":
                {
                    backcolor = Number(ANode.childNodes[_loc2].attributes.color);
                    break;
                } 
                case "rbstyle":
                {
                    rbstyle = ANode.childNodes[_loc2].childNodes[0];
                    break;
                } 
                case "cbstyle":
                {
                    cbstyle = ANode.childNodes[_loc2].childNodes[0];
                    break;
                } 
                case "toc":
                {
                    if (ANode.childNodes[_loc2].attributes.display == "1")
                    {
                        dtoc = true;
                    }
                    else
                    {
                        dtoc = false;
                    } // end else if
                    if (ANode.childNodes[_loc2].attributes.icons == "1")
                    {
                        dtocciicons = true;
                    }
                    else
                    {
                        dtocciicons = false;
                    } // end else if
                    if (ANode.childNodes[_loc2].attributes.points == "1")
                    {
                        dtocpoints = true;
                    }
                    else
                    {
                        dtocpoints = false;
                    } // end else if
                    break;
                } 
                case "qbdisplay":
                {
                    if (ANode.childNodes[_loc2].attributes.points == "1")
                    {
                        dpoints = true;
                    }
                    else
                    {
                        dpoints = false;
                    } // end else if
                    if (ANode.childNodes[_loc2].attributes.cscore == "1")
                    {
                        dcscore = true;
                    }
                    else
                    {
                        dcscore = false;
                    } // end else if
                    if (ANode.childNodes[_loc2].attributes.numbering == "1")
                    {
                        dnumbering = true;
                    }
                    else
                    {
                        dnumbering = false;
                    } // end else if
                    if (ANode.childNodes[_loc2].attributes.audio == "1")
                    {
                        daudio = true;
                    }
                    else
                    {
                        daudio = false;
                    } // end else if
                    if (ANode.childNodes[_loc2].attributes.info == "1")
                    {
                        dinfo = true;
                    }
                    else
                    {
                        dinfo = false;
                    } // end else if
                    if (ANode.childNodes[_loc2].attributes.infoemail != undefined)
                    {
                        infoemail = ANode.childNodes[_loc2].attributes.infoemail;
                    } // end if
                    if (ANode.childNodes[_loc2].attributes.infoweb != undefined)
                    {
                        infoweb = ANode.childNodes[_loc2].attributes.infoweb;
                    } // end if
                    numberingstyle = ANode.childNodes[_loc2].attributes.numberingstyle;
                    if (numberingstyle == undefined)
                    {
                        numberingstyle = "0";
                    } // end if
                    break;
                } 
                case "finishdisplay":
                {
                    if (ANode.childNodes[_loc2].attributes.passfailmessages == "1")
                    {
                        passfailmessages = true;
                    }
                    else
                    {
                        passfailmessages = false;
                    } // end else if
                    if (ANode.childNodes[_loc2].attributes.review == "1")
                    {
                        review = true;
                    }
                    else
                    {
                        review = false;
                    } // end else if
                    if (ANode.childNodes[_loc2].attributes.email == "1")
                    {
                        email = true;
                    }
                    else
                    {
                        email = false;
                    } // end else if
                    if (ANode.childNodes[_loc2].attributes.print == "1")
                    {
                        print = true;
                    }
                    else
                    {
                        print = false;
                    } // end else if
                    if (ANode.childNodes[_loc2].attributes.printusername == "1")
                    {
                        printusername = true;
                    }
                    else
                    {
                        printusername = false;
                    } // end else if
                    if (ANode.childNodes[_loc2].attributes.passmessage != undefined)
                    {
                        passmessage = this.RemoveCR(ANode.childNodes[_loc2].attributes.passmessage);
                    } // end if
                    if (ANode.childNodes[_loc2].attributes.failmessage != undefined)
                    {
                        failmessage = this.RemoveCR(ANode.childNodes[_loc2].attributes.failmessage);
                    } // end if
                    if (ANode.childNodes[_loc2].attributes.emailaddress != undefined)
                    {
                        emailaddress = ANode.childNodes[_loc2].attributes.emailaddress;
                    } // end if
                    break;
                } 
            } // End of switch
        } // end of for
    } // End of the function
} // End of Class
