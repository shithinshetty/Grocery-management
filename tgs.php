<?php
$con=new mysqli("localhost","root","","sales_inventory_db");

$result=$con->query("SELECT * FROM `logs`");
foreach ($result as $value) {
  echo $value['id'];
  echo $value['name'];
  echo $value['action'];
  echo $value['ddate'];

}

?>

<!DOCTYPE html>
<html>
    <title>
        <head> Fetch data from logs </head>
    </title>
 <body>
     <table align="center" border="1px" style="width:600px; line-height:40px">
     <tr>
         <th colspan="4"><h2>Customer deleted account records</h2></th>   
     </tr>
<t>
    <th> ID </th>
    <th> Name</th>
    <th>Action</th>
    <th>Date</th>
</t>
<?php
while($rows=mysqli_fetch_assoc($result))
{
    ?>
 <tr>
     <td><?php echo $rows['id']; ?></td>
     <td><?php echo $rows['name']; ?></td>
     <td><?php echo $rows['action']; ?></td>
     <td><?php echo $rows['ddate']; ?></td>
</tr>
<?php
}
?>
</table>
</body>
</html>