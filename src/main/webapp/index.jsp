<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/style.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <title>Facebook</title>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-lg-7">
            <h1 class="logo mt-4" style="color: #1275d8">facebook</h1>
            <p class="para1">Facebook helps you connect and share with the people in your life.</p>
        </div>
        <div class="col-lg-5">
            <div class="shadow p-3 mb-5 bg-white rounded text-center form-bg">
                <form action="/LoginServlet" method="post">
                    <div class="text-center">
                        <input class="email_input mt-3" type="email" for="email" id="email" name="email" placeholder="Email address or phone number" size="30">
                        <input  class="password_input" type="password" for="password" name="password" placeholder="Password" size="30">
                        <button type="submit" class="btn btn-primary btn-lg btn-block logging">Log In</button>
                        <p class="para">Forgotten password?</p>
                        <button type="submit" class="btn btn-success" data-toggle="modal" data-target="#signupmodal"><a href="#" style="color: #fff">Create New Account</a></button>
                    </div>
                </form>
            </div>
            <p class="mt-5"><a href="#">Create a Page</a> for a celebrity, band or business.</p>
        </div>
    </div>
</div>

<form action="Register" method="post">
    <div id="signupmodal" class="modal fade">
        <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">

                <div class="modal-title"><h2>Sign Up</h2><p class="paragraph">It's quick and easy.</p></div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>


            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <input type="text" required class="form-control input1" name="firstname" id="input" placeholder="First name">
                        </div>
                        <div class="form-group col-md-6">
                            <input type="text" required class="form-control"  name="lastname" id="input" placeholder="lastname">
                        </div>
                    </div>

                    <div class="form-group">
                        <input type="email" required class="form-control"  name="email" id="input"  placeholder="Mobile number or email address" size="30">
                    </div>
                    <div class="form-group">
                        <input type="password" required class="form-control"  name="password" id="input" placeholder="New Password" size="30">
                    </div>

                    <div class="row gender">
                        <div class="form-group col-md-4">

                            <label for="inputCity"><small> Date of birth</small></label>
                            <div>
                                <select aria-label="Day" required name="birthday_day" id="day" title="Day" class="_9407 _5dba _9hk6 _8esg _9m5o  date">
                                    <option value="1">1</option>
                                    <option value="2">2</option><option value="3">3</option>
                                    <option value="4">4</option><option value="5">5</option>
                                    <option value="6">6</option><option value="7">7</option>
                                    <option value="8">8</option><option value="9">9</option>
                                    <option value="10">10</option><option value="11">11</option>
                                    <option value="12">12</option><option value="13">13</option>
                                    <option value="14">14</option><option value="15">15</option>
                                    <option value="16">16</option><option value="17">17</option>
                                    <option value="18">18</option><option value="19">19</option>
                                    <option value="20">20</option><option value="21">21</option>
                                    <option value="22">22</option><option value="23">23</option>
                                    <option value="24">24</option><option value="25">25</option>
                                    <option value="26">26</option><option value="27">27</option>
                                    <option value="28">28</option><option value="29">29</option>
                                    <option value="30" selected="1">30</option><option value="31">31</option>
                                </select>
                            </div>
                        </div>


                        <div class="form-group col-md-4">
                            <div>
                                <select aria-label="Month" required name="birthday_month" id="month" title="Month" class="_9407 _5dba _9hk6 _8esg _9m5o date date1">
                                    <option value="1">Jan</option><option value="2">Feb</option>
                                    <option value="3">Mar</option><option value="4" selected="1">Apr</option>
                                    <option value="5">May</option><option value="6">Jun</option><option value="7">Jul</option>
                                    <option value="8">Aug</option><option value="9">Sep</option><option value="10">Oct</option>
                                    <option value="11">Nov</option><option value="12">Dec</option>
                                </select>
                            </div>
                        </div>


                        <div class="form-group col-md-4">
                            <div>
                                <select aria-label="Year" required name="birthday_year" id="year" title="Year" class="_9407 _5dba _9hk6 _8esg _9m5o date date1">
                                    <option value="2021" selected="1">2021</option><option value="2020">2020</option><option value="2019">2019</option>
                                    <option value="2018">2018</option><option value="2017">2017</option><option value="2016">2016</option>
                                    <option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option>
                                    <option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option>
                                    <option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option>
                                    <option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option>
                                    <option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option>
                                    <option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option>
                                    <option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option>
                                    <option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option>
                                    <option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option>
                                    <option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option>
                                    <option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option>
                                    <option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option>
                                    <option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option>
                                    <option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option>
                                    <option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option>
                                    <option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option>
                                    <option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option>
                                    <option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option>
                                    <option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option>
                                    <option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option>
                                    <option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option>
                                    <option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option>
                                    <option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option>
                                    <option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option>
                                    <option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option>
                                    <option value="1940">1940</option><option value="1939">1939</option><option value="1938">1938</option>
                                    <option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option>
                                    <option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option>
                                    <option value="1931">1931</option><option value="1930">1930</option><option value="1929">1929</option>
                                    <option value="1928">1928</option><option value="1927">1927</option><option value="1926">1926</option>
                                    <option value="1925">1925</option><option value="1924">1924</option><option value="1923">1923</option>
                                    <option value="1922">1922</option><option value="1921">1921</option><option value="1920">1920</option>
                                    <option value="1919">1919</option><option value="1918">1918</option><option value="1917">1917</option>
                                    <option value="1916">1916</option><option value="1915">1915</option><option value="1914">1914</option>
                                    <option value="1913">1913</option><option value="1912">1912</option><option value="1911">1911</option>
                                    <option value="1910">1910</option><option value="1909">1909</option><option value="1908">1908</option>
                                    <option value="1907">1907</option><option value="1906">1906</option><option value="1905">1905</option>
                                </select>
                            </div>
                        </div>
                    </div>


                    <div class="row gender">
                        <div class="form-group col-md-4">
                            <label for="inputCity"><small>Gender</small><i class="fas fa-question-circle"></i></label>                                    <div >
                                <span class="_5k_2 _5dba gender_female">
                                    <label class="_58mt gender_female1"      for="u_28_3_Fz">Female</label>
                                    <input type="radio" class="_8esa " name="gender" value="female" id="u_28_3_Fz">
                                </span>
                        </div>
                        </div>


                        <div class="form-group col-md-4">
                            <div class="gender_male">
                                <span class="_5k_2 _5dba">
                                    <label class="_58mt gender_male1" for="u_28_3_Fz">Male</label>
                                    <input type="radio" class="_8esa  gender_male2 " name="gender" value="male" id="u_28_3_Fz">
                                </span>
                            </div>
                        </div>

                    </div>
                    <p class="paragraph">By clicking Sign Up, you agree to our Terms, Data Policy and Cookie Policy.
                        You may receive SMS notifications from us and can opt out at any time.
                    </p>
                </form>
            </div>

            <div class="modal-footer but">
                <button type="submit" class="btn btn-success text">Save changes</button>
            </div>

        </div>
    </div>
</form>
</div>

<!-- jQuery first, then Tether, then Bootstrap JS. -->
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
</body>
</html>


