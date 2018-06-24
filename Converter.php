<?php

$icd10;
$icd9;
for($num = 1; $num <= 10; $num++){
    $filename = "PSI04 Technical Specifications $num";
    echo ("{$filename} \n");
    $file = file($filename);
    $bool = false;
    $count = 0;
    foreach($file as $it){
        if ($bool == true)
        {
            if($count == 0)
                $icd9[] = explode(',', $it);
            if($count == 2)
                $icd10[] = explode(',', $it);
            if($count == 5)
                $count = 0;
        }
        if($it == 'description'){
            $bool = true;
        }
    }
}

print_r($icd9);
print_r($icd10);
/*
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
*/
?>