import Group from './Group'

export const mainGroup = new Group()


/**
 * solar addons
 */

TimerStart(CreateTimer(), 0.03, true, () => {
    mainGroup.update()
})