from talon import Context, Module, actions, ctrl, settings, ui
from talon_plugins import eye_zoom_mouse

mod = Module()
ctx = Context()

mod.list(
    "mouse_button",
    desc="List of mouse button words to mouse_click index parameter",
)
mod.setting(
    "mouse_enable_pop_click",
    type=int,
    default=0,
    desc="Pop noise clicks left mouse button. 0 = off, 1 = on with eyetracker but not with zoom mouse mode, 2 = on but not with zoom mouse mode",
)
mod.setting(
    "mouse_enable_pop_stops_scroll",
    type=bool,
    default=False,
    desc="When enabled, pop stops continuous scroll modes (wheel upper/downer/gaze)",
)
mod.setting(
    "mouse_enable_pop_stops_drag",
    type=bool,
    default=False,
    desc="When enabled, pop stops mouse drag",
)
mod.setting(
    "mouse_wake_hides_cursor",
    type=bool,
    default=False,
    desc="When enabled, mouse wake will hide the cursor. mouse_wake enables zoom mouse.",
)


@mod.action_class
class Actions:
    def zoom_close():
        """Closes an in-progress zoom. Talon will move the cursor position but not click."""
        if eye_zoom_mouse.zoom_mouse.state == eye_zoom_mouse.STATE_OVERLAY:
            actions.tracking.zoom_cancel()

    def mouse_wake():
        """Enable control mouse, zoom mouse, and disables cursor"""
        actions.tracking.control_zoom_toggle(True)

        if settings.get("user.mouse_wake_hides_cursor"):
            actions.user.mouse_cursor_hide()

    def mouse_drag(button: int):
        """Press and hold/release a specific mouse button for dragging"""
        # Clear any existing drags
        actions.user.mouse_drag_end()

        # Start drag
        actions.mouse_drag(button)

    def mouse_drag_end() -> bool:
        """Releases any held mouse buttons"""
        buttons = ctrl.mouse_buttons_down()
        if buttons:
            for button in buttons:
                actions.mouse_release(button)
            return True
        return False

    def mouse_drag_toggle(button: int):
        """If the button is held down, release the button, else start dragging"""
        if button in ctrl.mouse_buttons_down():
            actions.mouse_release(button)
        else:
            actions.mouse_drag(button)

    def mouse_sleep():
        """Disables control mouse, zoom mouse, and re-enables cursor"""
        actions.tracking.control_zoom_toggle(False)
        actions.tracking.control_toggle(False)
        actions.tracking.control1_toggle(False)

        actions.user.mouse_cursor_show()
        actions.user.mouse_scroll_stop()
        actions.user.mouse_drag_end()

    # def mouse_scroll_down(amount: float = 1):
    #     """Scrolls down"""
    #     mouse_scroll(amount * settings.get("user.mouse_wheel_down_amount"))()

    # def mouse_scroll_down_continuous():
    #     """Scrolls down continuously"""
    #     global continuous_scroll_mode
    #     continuous_scroll_mode = "scroll down continuous"
    #     mouse_scroll(settings.get("user.mouse_continuous_scroll_amount"))()

    #     if scroll_job is None:
    #         start_scroll()

    #     if not settings.get("user.mouse_hide_mouse_gui"):
    #         gui_wheel.show()

    # def mouse_scroll_down_with_multiplier(multiplier: float = 1):
    #     """Scrolls down continuously take some multiplier argument"""
    #     global continuous_scroll_mode
    #     continuous_scroll_mode = "scroll down continuous"
    #     mouse_scroll(settings.get("user.mouse_continuous_scroll_amount")*multiplier)()

    #     if scroll_job is None:
    #         start_scroll()

    #     if not settings.get("user.mouse_hide_mouse_gui"):
    #         gui_wheel.show()

    # def mouse_scroll_up(amount: float = 1):
    #     """Scrolls up"""
    #     mouse_scroll(-amount * settings.get("user.mouse_wheel_down_amount"))()

    # def mouse_scroll_up_continuous():
    #     """Scrolls up continuously"""
    #     global continuous_scroll_mode
    #     continuous_scroll_mode = "scroll up continuous"
    #     mouse_scroll(-settings.get("user.mouse_continuous_scroll_amount"))()

    #     if scroll_job is None:
    #         start_scroll()
    #     if not settings.get("user.mouse_hide_mouse_gui"):
    #         gui_wheel.show()

    # def mouse_scroll_left(amount: float = 1):
    #     """Scrolls left"""
    #     actions.mouse_scroll(
    #         0, -amount * settings.get("user.mouse_wheel_horizontal_amount")
    #     )

    # def mouse_scroll_right(amount: float = 1):
    #     """Scrolls right"""
    #     actions.mouse_scroll(
    #         0, amount * settings.get("user.mouse_wheel_horizontal_amount")
    #     )

    # def mouse_scroll_stop():
    #     """Stops scrolling"""
    #     stop_scroll()

    # def mouse_gaze_scroll():
    #     """Starts gaze scroll"""
    #     global continuous_scroll_mode
    #     # this calls stop_scroll, which resets continuous_scroll_mode
    #     start_cursor_scrolling()

    #     continuous_scroll_mode = "gaze scroll"

    #     if not settings.get("user.mouse_hide_mouse_gui"):
    #         gui_wheel.show()

    #     # enable 'control mouse' if eye tracker is present and not enabled already
    #     global control_mouse_forced
    #     if not actions.tracking.control_enabled():
    #         actions.tracking.control_toggle(True)
    #         control_mouse_forced = True

    # def mouse_gaze_scroll_toggle():
    #     """If not scrolling, start gaze scroll, else stop scrolling."""
    #     if continuous_scroll_mode == "":
    #         actions.user.mouse_gaze_scroll()
    #     else:
    #         actions.user.mouse_scroll_stop()

    def copy_mouse_position():
        """Copy the current mouse position coordinates"""
        x, y = actions.mouse_x(), actions.mouse_y()
        actions.clip.set_text(f"{x}, {y}")

    def mouse_move_center_active_window():
        """Move the mouse cursor to the center of the currently active window"""
        rect = ui.active_window().rect
        actions.mouse_move(rect.center.x, rect.center.y)


@ctx.action_class("user")
class UserActions:
    def noise_trigger_pop():
        dont_click = False

        # Allow pop to stop drag
        if settings.get("user.mouse_enable_pop_stops_drag"):
            if actions.user.mouse_drag_end():
                dont_click = True

        # Allow pop to stop scroll
        if settings.get("user.mouse_enable_pop_stops_scroll"):
            if actions.user.mouse_scroll_stop():
                dont_click = True

        if dont_click:
            return

        # Otherwise respect the mouse_enable_pop_click setting
        setting_val = settings.get("user.mouse_enable_pop_click")

        is_using_eye_tracker = (
            actions.tracking.control_zoom_enabled()
            or actions.tracking.control_enabled()
            or actions.tracking.control1_enabled()
        )

        should_click = (
            setting_val == 2 and not actions.tracking.control_zoom_enabled()
        ) or (
            setting_val == 1
            and is_using_eye_tracker
            and not actions.tracking.control_zoom_enabled()
        )

        if should_click:
            ctrl.mouse_click(button=0, hold=16000)
