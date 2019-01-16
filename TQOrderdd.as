class TQOrderdd extends TQBase
{
    var _answered, answers, AnswersNumber, points, img;
    function TQOrderdd(atype)
    {
        super(atype);
        _answered = true;
    } // End of the function
    function AddAnswer(ANode)
    {
        var _loc3 = new Array();
        _loc3[0] = _global.RemoveCR(ANode.childNodes[0]);
        _loc3[1] = answers.length;
        _loc3[2] = -1;
        _loc3[3] = ANode.attributes.id;
        answers.push(_loc3);
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
    function GetUserOrder(AIndex)
    {
        if (AIndex >= 0 && AIndex < this.AnswersNumber())
        {
            return (answers[AIndex][2]);
        }
        else
        {
            return (-1);
        } // end else if
    } // End of the function
    function GetCorrectOrder(AIndex)
    {
        if (AIndex >= 0 && AIndex < this.AnswersNumber())
        {
            return (answers[AIndex][1]);
        }
        else
        {
            return (-1);
        } // end else if
    } // End of the function
    function GetIndexAtOrder(AOrder)
    {
        if (AOrder >= 0 && AOrder < this.AnswersNumber())
        {
            var _loc2;
            for (var _loc2 = 0; _loc2 < answers.length; ++_loc2)
            {
                if (AOrder == answers[_loc2][2])
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
    function GetResponseAsString()
    {
        var _loc5;
        var _loc3;
        var _loc4;
        _loc4 = "";
        for (var _loc5 = 0; _loc5 < answers.length; ++_loc5)
        {
            for (var _loc3 = 0; _loc3 < answers.length; ++_loc3)
            {
                if (_loc5 == answers[_loc3][2])
                {
                    _loc4 = _loc4 + answers[_loc3][0];
                    if (_loc5 < answers.length - 1)
                    {
                        _loc4 = _loc4 + _global.response_separator;
                    } // end if
                    break;
                } // end if
            } // end of for
        } // end of for
        return (_loc4);
    } // End of the function
    function GetResponseAsStringLMS()
    {
        var _loc5;
        var _loc4;
        var _loc3;
        _loc3 = "";
        for (var _loc5 = 0; _loc5 < answers.length; ++_loc5)
        {
            for (var _loc4 = 0; _loc4 < answers.length; ++_loc4)
            {
                if (_loc5 == answers[_loc4][2])
                {
                    if (length(_loc3) > 0)
                    {
                        _loc3 = _loc3 + _global.response_separator;
                    } // end if
                    _loc3 = _loc3 + chr(97 + answers[_loc4][1]);
                    break;
                } // end if
            } // end of for
        } // end of for
        return (_loc3);
    } // End of the function
    function GetCorrectResponseAsString()
    {
        var _loc5;
        var _loc3;
        var _loc4;
        _loc4 = "";
        for (var _loc5 = 0; _loc5 < answers.length; ++_loc5)
        {
            for (var _loc3 = 0; _loc3 < answers.length; ++_loc3)
            {
                if (_loc5 == answers[_loc3][1])
                {
                    _loc4 = _loc4 + answers[_loc3][0];
                    if (_loc5 < answers.length - 1)
                    {
                        _loc4 = _loc4 + _global.response_separator;
                    } // end if
                    break;
                } // end if
            } // end of for
        } // end of for
        return (_loc4);
    } // End of the function
    function GetCorrectResponseAsStringLMS()
    {
        var _loc5;
        var _loc4;
        var _loc3;
        _loc3 = "";
        for (var _loc5 = 0; _loc5 < answers.length; ++_loc5)
        {
            for (var _loc4 = 0; _loc4 < answers.length; ++_loc4)
            {
                if (_loc5 == answers[_loc4][1])
                {
                    if (length(_loc3) > 0)
                    {
                        _loc3 = _loc3 + _global.response_separator;
                    } // end if
                    _loc3 = _loc3 + chr(97 + answers[_loc4][1]);
                    break;
                } // end if
            } // end of for
        } // end of for
        return (_loc3);
    } // End of the function
    function ChangeOrder(oldorder, neworder)
    {
        var _loc2;
        _answered = true;
        if (oldorder == neworder)
        {
            return;
        } // end if
        if (oldorder < 0 || neworder < 0)
        {
            return;
        } // end if
        if (oldorder >= answers.length || neworder >= answers.length)
        {
            return;
        } // end if
        var _loc5;
        if (neworder < oldorder)
        {
            for (var _loc2 = 0; _loc2 < answers.length; ++_loc2)
            {
                if (answers[_loc2][2] == oldorder)
                {
                    _loc5 = _loc2;
                } // end if
                if (answers[_loc2][2] >= neworder && answers[_loc2][2] < oldorder)
                {
                    answers[_loc2][2] = answers[_loc2][2] + 1;
                } // end if
            } // end of for
            answers[_loc5][2] = neworder;
        }
        else
        {
            for (var _loc2 = 0; _loc2 < answers.length; ++_loc2)
            {
                if (answers[_loc2][2] == oldorder)
                {
                    _loc5 = _loc2;
                } // end if
                if (answers[_loc2][2] > oldorder && answers[_loc2][2] <= neworder)
                {
                    answers[_loc2][2] = answers[_loc2][2] - 1;
                } // end if
            } // end of for
            answers[_loc5][2] = neworder;
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
    function IsAnswered()
    {
        return (_answered);
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
    function HasImage()
    {
        if (img == undefined)
        {
            return (false);
        }
        else
        {
            return (true);
        } // end else if
    } // End of the function
    function LoadFromXML(ANode)
    {
        super.LoadFromXML(ANode);
        answers.sort(function ()
        {
            return (random(3) - 1);
        });
        var _loc3;
        var _loc4;
        _loc4 = answers.length;
        for (var _loc3 = 0; _loc3 < _loc4; ++_loc3)
        {
            answers[_loc3][2] = _loc3;
        } // end of for
    } // End of the function
    function XMLAddAnswers(my_xml, node_answers)
    {
        var _loc4;
        var _loc2;
        for (var _loc4 = 0; _loc4 < answers.length; ++_loc4)
        {
            for (var _loc2 = 0; _loc2 < answers.length; ++_loc2)
            {
                if (_loc4 == answers[_loc2][2])
                {
                    var _loc3 = my_xml.createElement("answer");
                    _loc3.attributes.id = answers[_loc2][3];
                    node_answers.appendChild(_loc3);
                    break;
                } // end if
            } // end of for
        } // end of for
        return (true);
    } // End of the function
} // End of Class
