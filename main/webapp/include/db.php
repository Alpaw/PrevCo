$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '';

$conn = mysql_connect($dbhost, $dbuser, $dbpass);

if (!$conn)
{
    die('Could not connect: ' . mysql_error());
}

    $lat= $_POST['lat']
    $long= $_POST['long'];


$sql = SELECT FROM VILLES_FRANCE_FREE WHERE ville_longitude_deg='$long' AND ville_lattitude_deg='$lat'";

mysql_select_db('prevco');
$retval = mysql_query($sql, $conn);

if (!$retval)
{
    die('Could not enter data: ' . mysql_error());
}

echo "Entered data successfully\n";
echo $retval;


mysql_close($conn);