<style>
   
</style>

<div class="containe-fluid">

	<div class="row">
		<div class="col-lg-12">
			
		</div>
	</div>

	<div class="row mt-3 ml-3 mr-3">
			<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				<?php echo "Welcome back ".$_SESSION['login_name']."!"  ?>
									
				</div>
				<hr>
				<div class="alert alert-success col-md-4 ml-4">
					<p><b><large>Total Sales Today</large></b></p>
				<hr>
					<p class="text-right"><b><large><?php 
					include 'db_connect.php';
					$sales = $conn->query("SELECT SUM(total_amount) as amount FROM sales_list where date(date_updated)= '".date('Y-m-d')."'");
					echo $sales->num_rows > 0 ? number_format($sales->fetch_array()['amount'],2) : "0.00";

					 ?></large></b></p>
				</div>
			</div>
			
		</div>
		</div>
	</div>

</div>
<script>
	
</script>