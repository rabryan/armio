/** file:       aclock.h
  * author:     <<AUTHOR>>
  */

#ifndef __CLOCK_H__
#define __CLOCK_H__

//___ I N C L U D E S ________________________________________________________

//___ M A C R O S ____________________________________________________________

//___ T Y P E D E F S ________________________________________________________

typedef void (*aclock_tick_callback_t)(void);

typedef struct aclock_state_t {
    /* similar to rtc_calendar_time */
    uint8_t  second;
    uint8_t  minute;
    uint8_t  hour;
    bool     pm;
    /** Day value, where day 1 is the first day of the month. */
    uint8_t  day;
    /** Month value, where month 1 is January. */
    uint8_t  month;
    uint16_t year;
} aclock_state_t;

//___ V A R I A B L E S ______________________________________________________

extern aclock_state_t aclock_global_state;

//___ P R O T O T Y P E S ____________________________________________________

void aclock_get_state( aclock_state_t *clock_state );
  /* @brief get state
   * @param user-provided state ptr to be filled
   * @retrn None
   */

void aclock_init( aclock_tick_callback_t tick_cb);
  /* @brief initalize clock module
   * @param callback to trigger on each clock tick (every second)
   * @retrn None
   */



#endif /* end of include guard: __CLOCK_H__ */
// vim: shiftwidth=2
