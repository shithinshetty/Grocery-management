<?php
include_once('connection.php');
$query="select * from logs";
$result=mysql_query($query);
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
while($rows=mysql_fetch_assoc($result))
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
<>