import turtle
import time

class SevenSegmentDisplay:
    def __init__(self):
        # Set up the turtle display window
        self.screen = turtle.Screen()
        self.screen.setup(800, 350, 200, 200)
        self.t = turtle.Turtle()
        self.t.speed(0)  # Fastest speed
        self.t.pensize(5)
        self.setup_turtle()
        
    def setup_turtle(self):
        """Initialize turtle position and settings"""
        self.t.penup()
        self.t.goto(-100, 0)
        self.t.clear()
        self.t.hideturtle()

    def draw_segment(self, draw):
        """Draw a single segment of the display with the option to draw or move"""
        self.t.penup()
        self.t.forward(5)  # Small gap before segment
        if draw:
            self.t.pendown()
        self.t.forward(50)  # Draw the segment
        self.t.penup()
        self.t.forward(5)  # Small gap after segment

    def draw_number(self, segments):
        """Draw a complete seven-segment number using the provided segment values"""
        # Store initial position
        start_x = -100
        start_y = 0
        
        # Draw horizontal segments (a, g, d)
        # Segment a (top)
        self.t.goto(start_x, start_y + 100)
        self.t.setheading(0)
        self.draw_segment(segments[0] == '1')
        
        # Segment g (middle)
        self.t.goto(start_x, start_y)
        self.t.setheading(0)
        self.draw_segment(segments[6] == '1')
        
        # Segment d (bottom)
        self.t.goto(start_x, start_y - 100)
        self.t.setheading(0)
        self.draw_segment(segments[3] == '1')
        
        # Draw vertical segments (f, b, e, c)
        # Left segments (f, e)
        for y_offset, segment in [(50, segments[5]), (-50, segments[4])]:
            self.t.goto(start_x, start_y + y_offset)
            self.t.setheading(270)
            self.draw_segment(segment == '1')
        
        # Right segments (b, c)
        for y_offset, segment in [(50, segments[1]), (-50, segments[2])]:
            self.t.goto(start_x + 60, start_y + y_offset)
            self.t.setheading(270)
            self.draw_segment(segment == '1')

def main():
    display = SevenSegmentDisplay()
    
    # Initialize counter state
    current_value = 0
    
    # Define segment patterns for digits 0-F
    patterns = {
        0: "1111110",  # 0
        1: "0110000",  # 1
        2: "1101101",  # 2
        3: "1111001",  # 3
        4: "0110011",  # 4
        5: "1011011",  # 5
        6: "1011111",  # 6
        7: "1110000",  # 7
        8: "1111111",  # 8
        9: "1111011",  # 9
        10: "1110111", # A
        11: "0011111", # b
        12: "1001110", # C
        13: "0111101", # d
        14: "1001111", # E
        15: "1000111"  # F
    }
    
    def increment_counter():
        """Increment the counter value and update display"""
        nonlocal current_value
        current_value = (current_value + 1) % 16
        update_display()
        
    def reset_counter():
        """Reset the counter to zero and update display"""
        nonlocal current_value
        current_value = 0
        update_display()
        
    def update_display():
        """Update the seven-segment display with current value"""
        display.t.clear()
        segments = patterns.get(current_value, "0000000")
        display.draw_number(segments)
        display.screen.update()
    
    # Set up keyboard controls
    display.screen.onkey(increment_counter, "space")
    display.screen.onkey(reset_counter, "r")
    display.screen.listen()
    
    # Show initial display
    update_display()
    
    # Keep the window open
    display.screen.mainloop()

if __name__ == "__main__":
    main()