resource "aws_subnet" "subnet" {
    vpc_id            = "${var.vpc_id}"
    cidr_block        = "${element(var.cidrs, count.index)}"
    availability_zone = "${element(var.availibility_zones, count.index)}"
    count             = "${length(var.cidrs)}"

    tags {
        Name = "${var.name}-${element(var.availibility_zones, count.index)}"
    }
}

resource "aws_route_table" "subnet" {
    vpc_id = "${var.vpc_id}"
    count  = "${length(var.cidrs)}"

    tags {
        name = "${var.name}-${element(var.availibility_zones, count.index)}"
    }
}

resource "aws_route_table_association" "subnet" {
    subnet_id      = "${element(aws_subnet.subnet.*.id, count.index)}"
    route_table_id = "${element(aws_route_table.subnet.*.id, count.index)}"
    count          = "${length(var.cidrs)}"
}