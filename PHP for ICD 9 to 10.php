<?php

$servername;
$username;
$password;
$dbname;

$connection = mysqli_connect($servername, $username, $password, $dbname);

if (!$connection)
{
    die("Connection to database failed with error#: " . mysqli_connect_error());
}

$sql = "SELECT value FROM <name_of_table> WHERE name ='nome';";

$result = mysqli_query($connection, $sql);
while($row = $result->fetch_assoc())
   $toEcho = $row["value"];
echo $toEcho;

if (!mysqli_query($conn, $sql))
{
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

echo "<p>".$sql."</p><br>";
?>