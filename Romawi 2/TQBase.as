class TQBase
{
    var _type, question, shuffle, img, answers, feedback, feedbackok, feedbackwrong, attempts, maxattempts, points, completed, imginclude, scenario, date, interactionid, id, latency;
    function TQBase(atype)
    {
        _type = atype;
        question = "";
        shuffle = "";
        img = "";
        answers = new Array();
        feedback = false;
        feedbackok = "";
        feedbackwrong = "";
        attempts = 0;
        maxattempts = 1;
        points = 0;
        completed = false;
        imginclude = false;
        scenario = "";
        date = 0;
        interactionid = "I1000";
        id = "1";
        latency = 0;
    } // End of the function
    function AddScenario(ANode)
    {
        if (ANode.attributes.scinclude == "1")
        {
            scenario = _global.RemoveCR(String(ANode.childNodes[0]));
        }
        else
        {
            scenario = "";
        } // end else if
    } // End of the function
    function AddQuestion(ANode)
    {
        question = _global.RemoveCR(String(ANode.childNodes[0]));
        shuffle = ANode.attributes.shuffle;
        interactionid = ANode.attributes.interactionid;
        id = ANode.attributes.id;
        imginclude = Boolean(ANode.attributes.imginclude);
        img = ANode.attributes.img;
        if (ANode.attributes.feedback == "y")
        {
            feedback = true;
            feedbackok = ANode.attributes.feedbackok;
            feedbackwrong = ANode.attributes.feedbackwrong;
            maxattempts = ANode.attributes.attempts;
        }
        else
        {
            feedback = false;
        } // end else if
        points = Number(ANode.attributes.points);
    } // End of the function
    function AddAnswer(ANode)
    {
        var _loc3 = new Array();
        _loc3[0] = _global.RemoveCR(ANode.childNodes[0]);
        if (ANode.attributes.correct == "y")
        {
            _loc3[1] = true;
        }
        else
        {
            _loc3[1] = false;
        } // end else if
        _loc3[2] = false;
        _loc3[3] = answers.length;
        _loc3[4] = ANode.attributes.id;
        answers.push(_loc3);
    } // End of the function
    function AnswersNumber()
    {
        return (answers.length);
    } // End of the function
    function GetAnswer(AIndex)
    {
        if (AIndex >= 0 && AIndex < this.AnswersNumber())
        {
            return (answers[AIndex][0]);
        }
        else
        {
            return ("");
        } // end else if
    } // End of the function
    function GetCorrect(AIndex)
    {
        if (AIndex >= 0 && AIndex < this.AnswersNumber())
        {
            return (answers[AIndex][1]);
        }
        else
        {
            return (false);
        } // end else if
    } // End of the function
    function SetResponse(AIndex, AResponse)
    {
        if (AIndex >= 0 && AIndex < this.AnswersNumber())
        {
            answers[AIndex][2] = AResponse;
        } // end if
    } // End of the function
    function GetResponse(AIndex)
    {
        if (AIndex >= 0 && AIndex < this.AnswersNumber())
        {
            return (answers[AIndex][2]);
        }
        else
        {
            return (false);
        } // end else if
    } // End of the function
    function UserResponse()
    {
        var _loc2;
        var _loc3 = answers.length;
        if (_loc3 <= 0)
        {
            return (false);
        }
        else
        {
            for (var _loc2 = 0; _loc2 < _loc3; ++_loc2)
            {
                if (answers[_loc2][1] != answers[_loc2][2])
                {
                    return (false);
                } // end if
            } // end of for
            return (true);
        } // end else if
    } // End of the function
    function GetResponseAsString()
    {
        var _loc4;
        _loc4 = "";
        var _loc3;
        var _loc5 = answers.length;
        if (_loc5 <= 0)
        {
        }
        else
        {
            for (var _loc3 = 0; _loc3 < _loc5; ++_loc3)
            {
                if (answers[_loc3][2] == true)
                {
                    _loc4 = _loc4 + answers[_loc3][0];
                    if (_loc3 < _loc5 - 1)
                    {
                        _loc4 = _loc4 + _global.response_separator;
                    } // end if
                } // end if
            } // end of for
        } // end else if
        return (_loc4);
    } // End of the function
    function GetResponseAsStringLMS()
    {
        var _loc3;
        _loc3 = "";
        var _loc4;
        var _loc5 = answers.length;
        if (_type == "tf")
        {
            if (_loc5 < 2)
            {
                if (_global.scoversion == 1)
                {
                    _loc3 = "true";
                }
                else
                {
                    _loc3 = "t";
                } // end else if
            }
            else if (answers[0][2] == true)
            {
                if (_global.scoversion == 1)
                {
                    _loc3 = "true";
                }
                else
                {
                    _loc3 = "t";
                } // end else if
            }
            else if (_global.scoversion == 1)
            {
                _loc3 = "false";
            }
            else
            {
                _loc3 = "f";
            } // end else if
            return (_loc3);
        } // end if
        if (_loc5 <= 0)
        {
        }
        else
        {
            for (var _loc4 = 0; _loc4 < _loc5; ++_loc4)
            {
                if (answers[_loc4][2] == true)
                {
                    if (length(_loc3) > 0)
                    {
                        _loc3 = _loc3 + _global.response_separator;
                    } // end if
                    _loc3 = _loc3 + chr(97 + answers[_loc4][3]);
                } // end if
            } // end of for
        } // end else if
        return (_loc3);
    } // End of the function
    function GetCorrectResponseAsString()
    {
        var _loc4;
        _loc4 = "";
        var _loc3;
        var _loc5 = answers.length;
        if (_loc5 <= 0)
        {
        }
        else
        {
            for (var _loc3 = 0; _loc3 < _loc5; ++_loc3)
            {
                if (answers[_loc3][1] == true)
                {
                    _loc4 = _loc4 + answers[_loc3][0];
                    if (_loc3 < _loc5 - 1)
                    {
                        _loc4 = _loc4 + _global.response_separator;
                    } // end if
                } // end if
            } // end of for
        } // end else if
        return (_loc4);
    } // End of the function
    function GetCorrectResponseAsStringLMS()
    {
        var _loc3;
        _loc3 = "";
        var _loc4;
        var _loc5 = answers.length;
        if (_type == "tf")
        {
            if (_loc5 < 2)
            {
                if (_global.scoversion == 1)
                {
                    _loc3 = "true";
                }
                else
                {
                    _loc3 = "t";
                } // end else if
            }
            else if (answers[0][1] == true)
            {
                if (_global.scoversion == 1)
                {
                    _loc3 = "true";
                }
                else
                {
                    _loc3 = "t";
                } // end else if
            }
            else if (_global.scoversion == 1)
            {
                _loc3 = "false";
            }
            else
            {
                _loc3 = "f";
            } // end else if
            return (_loc3);
        } // end if
        if (_loc5 <= 0)
        {
        }
        else
        {
            for (var _loc4 = 0; _loc4 < _loc5; ++_loc4)
            {
                if (answers[_loc4][1] == true)
                {
                    if (length(_loc3) > 0)
                    {
                        _loc3 = _loc3 + _global.response_separator;
                    } // end if
                    _loc3 = _loc3 + chr(97 + answers[_loc4][3]);
                } // end if
            } // end of for
        } // end else if
        return (_loc3);
    } // End of the function
    function IsAnswered()
    {
        var _loc2;
        var _loc3 = answers.length;
        if (_loc3 <= 0)
        {
            return (true);
        }
        else
        {
            for (var _loc2 = 0; _loc2 < _loc3; ++_loc2)
            {
                if (answers[_loc2][2] == true)
                {
                    return (true);
                } // end if
            } // end of for
            return (false);
        } // end else if
    } // End of the function
    function ResultPoints()
    {
        if (this.UserResponse() == true)
        {
            return (Number(points));
        }
        else
        {
            return (Number(0));
        } // end else if
    } // End of the function
    function AddLatency(avalue)
    {
        latency = latency + avalue;
    } // End of the function
    function HasImage()
    {
        if (img == undefined || imginclude == false)
        {
            return (false);
        }
        else
        {
            return (true);
        } // end else if
    } // End of the function
    function Pad(avalue)
    {
        if (length(avalue) == 1)
        {
            return ("0" + avalue);
        }
        else
        {
            return (avalue);
        } // end else if
    } // End of the function
    function SetDateTime()
    {
        if (_global.review == false)
        {
            if (date == 0)
            {
                date = new Date();
            } // end if
        } // end if
    } // End of the function
    function GetTypeAsString()
    {
        switch (_type)
        {
            case "tf":
            {
                return ("true-false");
                break;
            } 
            case "mc":
            {
                return ("single-answer");
                break;
            } 
            case "mr":
            {
                return ("multiple-answers");
                break;
            } 
            case "ed":
            {
                return ("short-answer");
                break;
            } 
            case "wb":
            {
                return ("wordbank");
                break;
            } 
            case "mdd":
            {
                return ("matching");
                break;
            } 
            case "cz":
            {
                return ("click-map");
                break;
            } 
            case "odd":
            {
                return ("order");
                break;
            } 
        } // End of switch
        return ("");
    } // End of the function
    function GetTypeAsStringLMS()
    {
        switch (_type)
        {
            case "tf":
            {
                return ("true-false");
                break;
            } 
            case "mc":
            {
                return ("choice");
                break;
            } 
            case "mr":
            {
                return ("choice");
                break;
            } 
            case "ed":
            {
                return ("fill-in");
                break;
            } 
            case "wb":
            {
                return ("choice");
                break;
            } 
            case "mdd":
            {
                return ("matching");
                break;
            } 
            case "cz":
            {
                return ("choice");
                break;
            } 
            case "odd":
            {
                return ("sequencing");
                break;
            } 
        } // End of switch
        return ("");
    } // End of the function
    function GetDateAsString()
    {
        if (date == 0)
        {
            return (date);
        }
        else
        {
            var _loc2;
            _loc2 = this.Pad(date.getMonth() + 1) + "/" + this.Pad(date.getDate()) + "/" + date.getFullYear();
            return (_loc2);
        } // end else if
    } // End of the function
    function GetTimeAsString()
    {
        if (date == 0)
        {
            return (date);
        }
        else
        {
            var _loc2;
            _loc2 = this.Pad(date.getHours()) + ":" + this.Pad(date.getMinutes()) + ":" + this.Pad(date.getSeconds());
            return (_loc2);
        } // end else if
    } // End of the function
    function GetLatency()
    {
        return (_global.FormatTime(latency));
    } // End of the function
    function EmailResult()
    {
        var _loc3;
        _loc3 = "";
        _loc3 = _loc3 + _global.emailbefore;
        if (date == 0)
        {
            _loc3 = _loc3 + date + _global.emailafter;
            _loc3 = _loc3 + _global.emailbefore + date + _global.emailafter;
        }
        else
        {
            _loc3 = _loc3 + this.GetDateAsString() + _global.emailafter;
            _loc3 = _loc3 + _global.emailbefore + this.GetTimeAsString() + _global.emailafter;
        } // end else if
        _loc3 = _loc3 + _global.emailbefore + interactionid + _global.emailafter;
        _loc3 = _loc3 + _global.emailbefore + this.GetTypeAsString() + _global.emailafter;
        _loc3 = _loc3 + _global.emailbefore + this.GetResponseAsString() + _global.emailafter;
        _loc3 = _loc3 + _global.emailbefore;
        if (this.IsAnswered() == false)
        {
            _loc3 = _loc3 + _global.GetText("reportiincomplete");
        }
        else if (this.UserResponse() == true)
        {
            _loc3 = _loc3 + _global.GetText("reporticorrect");
        }
        else
        {
            _loc3 = _loc3 + _global.GetText("reportiincorrect");
        } // end else if
        _loc3 = _loc3 + _global.emailafter;
        _loc3 = _loc3 + _global.emailbefore + this.ResultPoints() + _global.emailafter;
        _loc3 = _loc3 + _global.emailbefore + "1" + _global.emailafter;
        _loc3 = _loc3 + _global.emailbefore + this.GetLatency() + _global.emailfinish;
        return (_loc3);
    } // End of the function
    function XMLAddNode(my_xml, node_parent, node_name, node_value)
    {
        var _loc1 = my_xml.createElement(node_name);
        var _loc2 = my_xml.createTextNode(node_value);
        _loc1.appendChild(_loc2);
        node_parent.appendChild(_loc1);
    } // End of the function
    function XMLAddAnswers(my_xml, node_answers)
    {
        var _loc2;
        var _loc4 = answers.length;
        if (_loc4 <= 0)
        {
        }
        else
        {
            for (var _loc2 = 0; _loc2 < _loc4; ++_loc2)
            {
                var _loc3 = my_xml.createElement("answer");
                node_answers.appendChild(_loc3);
                if (answers[_loc2][2] == true)
                {
                    _loc3.attributes.userresponse = "y";
                } // end if
                _loc3.attributes.id = answers[_loc2][4];
            } // end of for
        } // end else if
        return (true);
    } // End of the function
    function GenerateXML(my_xml, node_item)
    {
        this.XMLAddNode(my_xml, node_item, "id", id);
        var _loc4 = my_xml.createElement("answers");
        node_item.appendChild(_loc4);
        this.XMLAddAnswers(my_xml, _loc4);
        if (_type == "ed" || _type == "cz")
        {
            _loc4.removeNode();
        } // end if
        var _loc3;
        if (this.IsAnswered() == false)
        {
            _loc3 = _global.GetText("reportiincomplete");
        }
        else if (this.UserResponse() == true)
        {
            _loc3 = _global.GetText("reporticorrect");
        }
        else
        {
            _loc3 = _global.GetText("reportiincorrect");
        } // end else if
        this.XMLAddNode(my_xml, node_item, "result", _loc3);
        return (true);
    } // End of the function
    function LoadFromXML(ANode)
    {
        for (var _loc2 = 0; ANode.childNodes[_loc2]; ++_loc2)
        {
            switch (ANode.childNodes[_loc2].nodeName)
            {
                case "scenario":
                {
                    this.AddScenario(ANode.childNodes[_loc2]);
                    break;
                } 
                case "question":
                {
                    this.AddQuestion(ANode.childNodes[_loc2]);
                    break;
                } 
                case "answer":
                {
                    this.AddAnswer(ANode.childNodes[_loc2]);
                    break;
                } 
            } // End of switch
        } // end of for
        if (shuffle.toLowerCase() == "y")
        {
            answers.sort(function ()
            {
                return (random(5) - 1);
            });
        } // end if
    } // End of the function
} // End of Class
