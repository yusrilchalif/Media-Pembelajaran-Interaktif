class TQMatchdd extends TQBase
{
    var match, answers, AnswersNumber, shuffle;
    function TQMatchdd(atype)
    {
        super(atype);
        match = new Array();
    } // End of the function
    function AddAnswer(ANode)
    {
        var _loc3 = new Array();
        var _loc4 = new Array();
        _loc3[0] = _global.RemoveCR(ANode.childNodes[0]);
        _loc3[1] = answers.length;
        _loc3[2] = -1;
        _loc3[3] = -1;
        _loc3[4] = ANode.attributes.id;
        _loc4[0] = _global.RemoveCR(ANode.attributes.match);
        _loc4[1] = _loc3[1];
        _loc4[2] = match.length;
        _loc4[3] = ANode.attributes.idc;
        answers.push(_loc3);
        match.push(_loc4);
    } // End of the function
    function GetResponseAsString()
    {
        var _loc4;
        _loc4 = "";
        var _loc5;
        var _loc3;
        var _loc6 = answers.length;
        if (_loc6 <= 0)
        {
        }
        else
        {
            for (var _loc5 = 0; _loc5 < _loc6; ++_loc5)
            {
                _loc4 = _loc4 + match[_loc5][0];
                for (var _loc3 = 0; _loc3 < _loc6; ++_loc3)
                {
                    if (answers[_loc3][3] == _loc5)
                    {
                        _loc4 = _loc4 + "." + answers[_loc3][0];
                    } // end if
                } // end of for
                if (_loc5 < _loc6 - 1)
                {
                    _loc4 = _loc4 + _global.response_separator;
                } // end if
            } // end of for
        } // end else if
        return (_loc4);
    } // End of the function
    function GetResponseAsStringLMS()
    {
        var _loc3;
        _loc3 = "";
        var _loc5;
        var _loc4;
        var _loc6 = answers.length;
        if (_loc6 <= 0)
        {
        }
        else
        {
            for (var _loc5 = 0; _loc5 < _loc6; ++_loc5)
            {
                if (length(_loc3) > 0)
                {
                    _loc3 = _loc3 + _global.response_separator;
                } // end if
                _loc3 = _loc3 + match[_loc5][2];
                for (var _loc4 = 0; _loc4 < _loc6; ++_loc4)
                {
                    if (answers[_loc4][3] == _loc5)
                    {
                        if (_global.scoversion == 1)
                        {
                            _loc3 = _loc3 + "[.]";
                        }
                        else
                        {
                            _loc3 = _loc3 + ".";
                        } // end else if
                        _loc3 = _loc3 + chr(97 + answers[_loc4][1]);
                    } // end if
                } // end of for
            } // end of for
        } // end else if
        return (_loc3);
    } // End of the function
    function GetCorrectResponseAsString()
    {
        var _loc4;
        _loc4 = "";
        var _loc5;
        var _loc3;
        var _loc6 = answers.length;
        if (_loc6 <= 0)
        {
        }
        else
        {
            for (var _loc5 = 0; _loc5 < _loc6; ++_loc5)
            {
                _loc4 = _loc4 + match[_loc5][0];
                for (var _loc3 = 0; _loc3 < _loc6; ++_loc3)
                {
                    if (answers[_loc3][1] == match[_loc5][1])
                    {
                        _loc4 = _loc4 + "." + answers[_loc3][0];
                    } // end if
                } // end of for
                if (_loc5 < _loc6 - 1)
                {
                    _loc4 = _loc4 + _global.response_separator;
                } // end if
            } // end of for
        } // end else if
        return (_loc4);
    } // End of the function
    function GetCorrectResponseAsStringLMS()
    {
        var _loc3;
        _loc3 = "";
        var _loc5;
        var _loc4;
        var _loc6 = answers.length;
        if (_loc6 <= 0)
        {
        }
        else
        {
            for (var _loc5 = 0; _loc5 < _loc6; ++_loc5)
            {
                if (length(_loc3) > 0)
                {
                    _loc3 = _loc3 + _global.response_separator;
                } // end if
                _loc3 = _loc3 + match[_loc5][2];
                for (var _loc4 = 0; _loc4 < _loc6; ++_loc4)
                {
                    if (answers[_loc4][1] == match[_loc5][1])
                    {
                        if (_global.scoversion == 1)
                        {
                            _loc3 = _loc3 + "[.]";
                        }
                        else
                        {
                            _loc3 = _loc3 + ".";
                        } // end else if
                        _loc3 = _loc3 + chr(97 + answers[_loc4][1]);
                    } // end if
                } // end of for
            } // end of for
        } // end else if
        return (_loc3);
    } // End of the function
    function GetMatch(AIndex)
    {
        if (AIndex >= 0 && AIndex < this.AnswersNumber())
        {
            return (match[AIndex][0]);
        }
        else
        {
            return ("");
        } // end else if
    } // End of the function
    function GetMatchIndex(AIndex)
    {
        if (AIndex >= 0 && AIndex < this.AnswersNumber())
        {
            return (Number(match[AIndex][1]));
        }
        else
        {
            return (-1);
        } // end else if
    } // End of the function
    function GetResponse(AIndex)
    {
    } // End of the function
    function GetOrder(AIndex)
    {
        if (AIndex >= 0 && AIndex < this.AnswersNumber())
        {
            return (answers[AIndex][3]);
        }
        else
        {
            return (0);
        } // end else if
    } // End of the function
    function SetOrder(AIndex, ANewOrder)
    {
        if (AIndex >= 0 && AIndex < this.AnswersNumber())
        {
            answers[AIndex][3] = ANewOrder;
            return (ANewOrder);
        }
        else
        {
            return (-1);
        } // end else if
    } // End of the function
    function GetIndexFromOrder(AOrder)
    {
        var _loc2;
        var _loc3 = answers.length;
        if (_loc3 <= 0)
        {
            return (-1);
        }
        else
        {
            for (var _loc2 = 0; _loc2 < _loc3; ++_loc2)
            {
                if (answers[_loc2][3] == AOrder)
                {
                    return (_loc2);
                } // end if
            } // end of for
            return (-1);
        } // end else if
    } // End of the function
    function GetAnswerMatchIndex(AIndex)
    {
        if (AIndex >= 0 && AIndex < this.AnswersNumber())
        {
            return (Number(answers[AIndex][2]));
        }
        else
        {
            return (-1);
        } // end else if
    } // End of the function
    function GetAnswerMatchOrder(AIndex)
    {
        if (AIndex >= 0 && AIndex < this.AnswersNumber())
        {
            var _loc2;
            var _loc4;
            var _loc3;
            _loc3 = answers[AIndex][1];
            _loc4 = answers.length;
            for (var _loc2 = 0; _loc2 < _loc4; ++_loc2)
            {
                if (match[_loc2][1] == _loc3)
                {
                    return (_loc2);
                } // end if
            } // end of for
            return (-1);
        }
        else
        {
            return (-1);
        } // end else if
    } // End of the function
    function SetAnswerMatchIndex(AIndex, AMatch)
    {
        if (AIndex >= 0 && AIndex < this.AnswersNumber())
        {
            answers[AIndex][2] = AMatch;
        } // end if
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
    function GetCorrect(AIndex)
    {
        if (AIndex >= 0 && AIndex < this.AnswersNumber())
        {
            if (answers[AIndex][1] == answers[AIndex][2])
            {
                return (true);
            }
            else
            {
                return (false);
            } // end else if
        }
        else
        {
            return (false);
        } // end else if
    } // End of the function
    function IsAnswered()
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
                if (answers[_loc2][2] == -1)
                {
                    return (false);
                } // end if
            } // end of for
            return (true);
        } // end else if
    } // End of the function
    function LoadFromXML(ANode)
    {
        super.LoadFromXML(ANode);
        answers.sort(function ()
        {
            return (random(5) - 1);
        });
        var _loc4 = this.AnswersNumber();
        var _loc3;
        for (var _loc3 = 0; _loc3 < _loc4; ++_loc3)
        {
            answers[_loc3][3] = _loc3;
        } // end of for
        if (shuffle.toLowerCase() == "y")
        {
            match.sort(function ()
            {
                return (random(5) - 1);
            });
        } // end if
    } // End of the function
    function XMLAddAnswers(my_xml, node_answers)
    {
        var _loc3;
        var _loc2;
        var _loc5 = answers.length;
        if (_loc5 <= 0)
        {
        }
        else
        {
            for (var _loc3 = 0; _loc3 < _loc5; ++_loc3)
            {
                var _loc4 = my_xml.createElement("answer");
                node_answers.appendChild(_loc4);
                for (var _loc2 = 0; _loc2 < _loc5; ++_loc2)
                {
                    if (answers[_loc2][3] == _loc3)
                    {
                        _loc4.attributes.id = answers[_loc2][4];
                    } // end if
                } // end of for
                _loc4.attributes.idc = match[_loc3][3];
            } // end of for
        } // end else if
        return (true);
    } // End of the function
} // End of Class
