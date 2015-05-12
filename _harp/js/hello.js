define(['hello'], function() {
    var hello = { 
        init: function() {
            this.is_hello = true;
            this.canvas = document.getElementById("hello");
            var viewportWidth = window.innerWidth;
            var viewportHeight = window.innerHeight;

            this.canvas.width = 300;
            this.canvas.height = 165;
            this.canvas.style.width = "300px";
            this.canvas.style.height = "165px";
            //this.canvas.style.zIndex = 1;
            this.canvas.style.margin = "0px auto";
            //this.canvas.style.top = (viewportHeight - this.canvas.height) / 2 + "px";
            //this.canvas.style.left = (viewportWidth - this.canvas.width) / 2 + "px";

            this.ctx = this.canvas.getContext("2d");
            this.offset = 0;
            setInterval(this.animate.bind(this), 100);
            this.square_side_length = 20;
            this.letter_height = 5;
            this.rainbow = {"h": ["#5C1F99",  
                                  "#6C35A3",
                                  "#7D4CAD",
                                  "#8D62B8",
                                  "#9D79C2",
                                  "#AE8FCC"],
                            "e" : ["#66FF66",
                                   "#75FF75",
                                   "#85FF85",
                                   "#94FF94",
                                   "#A3FFA3",
                                   "#B2FFB2"],
                            "l" : ["#FF0066",
                                   "#FF1975",
                                   "#FF3385",
                                   "#FF4D94",
                                   "#FF66A3",
                                   "#FF80B2" ],
                            "o" : ["#0099FF",
                                   "#19A3FF",
                                   "#33ADFF",
                                   "#4DB8FF",
                                   "#66C2FF",
                                   "#80CCFF"],
                            "period" : ["#FFFF33", 
                                        "#FFFF47",
                                        "#FFFF5C",
                                        "#FFFF70",
                                        "#FFFF85",
                                        "#FFFF99"]};

            //this.canvas.onclick = function() { this.switch_words() }.bind(this);
        }, 

        switch_words: function() {
            alert("yo");
        },

        animate: function() {
            //this.print_h();
            this.print_k();
            this.print_e();
            this.print_l1();
            this.print_l2();
            //this.print_o();
            this.print_y();
            //this.print_period();
            this.print_exclamaition_mark();
            this.offset = (this.offset >= 5) ? 0: this.offset + 1;
        },

        print_k: function() {
            this.draw_vertical_line(0, 5, 5, "black");
            this.draw_horizontal_line(40, 45, 1, "black");
            this.draw_horizontal_line(20, 65, 1, "black");
            //this.draw_horizontal_line(30, 75, 1, "black");
            this.draw_horizontal_line(40, 85, 1, "black");
            //this.draw_vertical_line(45, 65, 2, "black");

            this.draw_vertical_line(5, 0, 5, "h");
            this.draw_horizontal_line(45, 40, 1, "h");
            this.draw_horizontal_line(25, 60, 1, "h");
            this.draw_horizontal_line(45, 80, 1, "h");
            //this.draw_horizontal_line(35, 70, 1, "h");

            //this.draw_vertical_line(50, 60, 2, "k");            
        },
        
        print_h: function() {
            this.draw_vertical_line(0, 5, 5, "black");
            this.draw_horizontal_line(20, 45, 2, "black");
            this.draw_vertical_line(45, 65, 2, "black");

            this.draw_vertical_line(5, 0, 5, "h");
            this.draw_horizontal_line(25, 40, 2, "h");
            this.draw_vertical_line(50, 60, 2, "h");
        },

        print_e: function() {
            this.draw_vertical_line(70, 45, 3, "black");
            this.draw_horizontal_line(90, 45, 1, "black");
            this.draw_vertical_line(100, 60, 1, "black");
            this.draw_horizontal_line(90, 85, 2, "black");

            this.draw_vertical_line(75, 40, 3, "e");
            this.draw_horizontal_line(95, 40, 1, "e");
            this.draw_vertical_line(105, 55, 1, "e");
            this.draw_horizontal_line(95, 80, 2, "e");
        },

        print_l1: function() {
            this.draw_vertical_line(135, 5, 5, "black");
            this.draw_vertical_line(140, 0, 5, "l");
        },

        print_l2: function() {
            this.draw_vertical_line(160, 5, 5, "black");
            this.draw_vertical_line(165, 0, 5, "l");
        },

        print_o: function() {
            this.draw_vertical_line(185, 45, 3, "black");
            this.draw_horizontal_line(205, 45, 1, "black");
            this.draw_horizontal_line(205, 85, 1, "black");
            this.draw_vertical_line(225, 45, 3, "black");

            this.draw_vertical_line(190, 40, 3, "o");
            this.draw_horizontal_line(210, 40, 1, "o");
            this.draw_horizontal_line(210, 80, 1, "o");
            this.draw_vertical_line(230, 40, 3, "o");
        },

        print_y: function() {
            this.draw_vertical_line(185, 65, 2, "black");
            //this.draw_horizontal_line(205, 45, 1, "black");
            this.draw_horizontal_line(205, 85, 1, "black");
            this.draw_vertical_line(225, 45, 6, "black");

            this.draw_vertical_line(190, 60, 2, "o");
            //this.draw_horizontal_line(210, 40, 1, "o");
            this.draw_horizontal_line(210, 80, 1, "o");
            this.draw_vertical_line(230, 40, 6, "o");
        },

        print_period: function() {
            this.draw_vertical_line(255, 85, 1, "black");
            this.draw_vertical_line(260, 80, 1, "period");
        },

        print_exclamaition_mark: function() {
            this.draw_vertical_line(255, 5, 3, "black");
            this.draw_vertical_line(260, 0, 3, "period");

            this.draw_vertical_line(255, 85, 1, "black");
            this.draw_vertical_line(260, 80, 1, "period");
        },

        draw_vertical_line: function(x_offset, y_offset, number, color) {
            var x, y;
            for(var i = 0; i < number * this.square_side_length; i+= this.square_side_length) {
                x = 0 + x_offset;
                y = i + y_offset;

                if(this.rainbow[color] != null) {
                    this.determine_fill_color(x, y, color);
                } else {
                    this.ctx.fillStyle = color;
                }

                this.ctx.fillRect(x, y, this.square_side_length, this.square_side_length);
            }
        },

        draw_horizontal_line: function(x_offset, y_offset, number, color) {
            if(this.rainbow[color] != null) {
                this.determine_fill_color(x_offset, y_offset, color);
            } else {
                this.ctx.fillStyle = color;                
            }

            for(var i=0; i < number * this.square_side_length; i+= this.square_side_length) {
                this.ctx.fillRect(x_offset + i, y_offset, this.square_side_length, this.square_side_length);
            }
        },

        determine_fill_color: function(x, y, color) {
            // var index = Math.floor((((x + y) / this.square_side_length) + this.offset) % 5);
            var index = Math.floor((y / this.square_side_length) + this.offset) % 6;
            this.ctx.fillStyle = this.rainbow[color][index];
        }
    };

    return hello;
});
